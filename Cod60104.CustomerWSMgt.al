codeunit 60104 CustomerWSMgt
{
    trigger OnRun()
    begin

    end;

    procedure CloneCustomer(CustomerNo: Code[20])
    var
        Customer: Record Customer;
        NewCustomer: Record Customer;
    begin
        Customer.Get(CustomerNo);
        NewCustomer.Init();
        NewCustomer.TransferFields(Customer, false);
        NewCustomer.Name := 'CUSTOMER BOUND ACTION';
        NewCustomer.Insert(TRUE);

    end;

    procedure GetSalesAmount(CustomerNo: Code[20]): Decimal
    var
        SalesLine: Record "Sales Line";
        Total: Decimal;
    begin
        SalesLine.SetRange("Document Type", SalesLine."Document Type");
        SalesLine.SetRange("Sell-to Customer No.", CustomerNo);
        SalesLine.SetFilter(Type, '<>%1', SalesLine.Type::" ");
        if SalesLine.FindSet() then
            repeat
                Total += SalesLine."Line Amount";
            until SalesLine.Next() = 0;
        exit(Total);
    end;

    var
        //myInt: Integer;
}