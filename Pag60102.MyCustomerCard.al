page 60102 MyCustomerCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Id; Id)
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }

                field(Name; Name)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    [ServiceEnabled]
    procedure CloneCustomer(var actionContext: WebServiceActionContext)
    var
        CustomerWSWMgt: Codeunit CustomerWSMgt;
    begin
        CustomerWSWMgt.CloneCustomer(Rec."No.");
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::MyCustomerCard);
        actionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        actionContext.SetResultCode(WebServiceActionResultCode::Created);
    End;

    [ServiceEnabled]
    procedure GetSalesAmount(CustomerNo: Code[20]): Decimal
    var
        CustomerWSMgt: Codeunit CustomerWSMgt;
        actionContext: WebServiceActionContext;
        Total: Decimal;
    begin
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetObjectId(Page::MyCustomerCard);
        actionContext.AddEntityKey(Rec.FieldNo("No."), Rec."No.");
        Total := CustomerWSMgt.GetSalesAmount(CustomerNo);
        actionContext.SetResultCode(WebServiceActionResultCode::Get);
        exit(Total);
    end;

    var

    //myInt: Integer;
}