codeunit 60102 MyInstallCodeunit1
{
    Subtype = Install;

    trigger OnInstallAppPerCompany();
    var
        myAppInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(myAppInfo); // Get info about the currently executing module

        if myAppInfo.DataVersion() = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
            HandleFreshInstall()
        else
            HandleReinstall(); // If not a fresh install, then we are Re-installing the same version of the extension
    end;

    local procedure HandleFreshInstall();
    begin
        // Do work needed the first time this extension is ever installed for this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was installed
        // - Initial data setup for use
        For i := 4 to 5 DO BEGIN
            RewardLevelRec.INIT();
            RewardLevelRec.Level := 'Level ' + FORMAT(i);
            RewardLevelRec."Minimum Reward Points" := i;
            If RewardLevelRec.Insert() THEN;
        END;
    end;

    local procedure HandleReinstall();
    begin
        // Do work needed when reinstalling the same version of this extension back on this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was reinstalled
        // - Data 'patchup' work, for example, detecting if new 'base' records have been changed while you have been working 'offline'.
        // - Setup 'welcome back' messaging for next user access.
        For i := 1 to 3 DO BEGIN
            RewardLevelRec.INIT();
            RewardLevelRec.Level := 'Level ' + FORMAT(i);
            RewardLevelRec."Minimum Reward Points" := i;
            If RewardLevelRec.Insert() THEN;
        END;
    end;

    var
        RewardLevelRec: Record "Reward Level";
        i: Integer;
}