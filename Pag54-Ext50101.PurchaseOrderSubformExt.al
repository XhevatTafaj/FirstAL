pageextension 50101 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Document No.")
        {
            field("Long Description"; "Long Description")
            {

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}