page 60103 "Process Xml Files"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Process Xml File";

    layout
    {
        area(Content)
        {
            repeater("Repeater")
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = All;

                }
                field("File Name"; "File Name")
                {
                    ApplicationArea = All;
                }
                field("File"; "File")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Xmml File")
            {
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = TRUE;
                trigger OnAction();
                begin
                    XmlMgt.Run();
                end;
            }
        }
    }
    var
        XmlMgt: Codeunit "XML Mgt.";
}