page 50100 TestExcel
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'TestExcel';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Name; 'NameSource')
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateEcel)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    Cod50100: Codeunit CreateAndOpenExcelOnExtension;
                begin
                    Cod50100.CreateExcelHeader();
                    Cod50100.CreateExcelBook();
                end;
            }
        }
    }

    var
        myInt: Integer;
}