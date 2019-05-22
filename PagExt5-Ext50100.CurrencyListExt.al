pageextension 50100 CurrencyListExt extends Currencies
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Exch. &Rates")
        {
            action(GetExchangeRate)
            {
                caption = 'Get Exchane Rates';
                Promoted = TRUE;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = all;
                trigger OnAction()
                var
                    GetExchangeRate: Codeunit GetExchangeRate;
                begin
                    GetExchangeRate.GetExchangeRate(Rec);
                end;
            }
        }
    }


    var
        myInt: Integer;
}