tableextension 50100 PurchaseSubFormExt extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Long Description"; Text[2048])
        {
            DataClassification = ToBeClassified;

        }
    }

    var
        myInt: Integer;
}