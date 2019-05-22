codeunit 50101 GetExchangeRate
{
    procedure GetExchangeRate(Currency: record Currency)
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        ResponseText: text;
        GenLedgSetup: record "General Ledger Setup";
        url: text;
    begin
        GenLedgSetup.get;
        url := StrSubstNo('http://data.fixer.io/api/latest?access_key=68e9a646bc6c0470fd7c5ba906e6cb28&base=%1&symbols=%2', GenLedgSetup.GetCurrencyCode(''), Currency.Code);

        If HttpClient.Get(url, HttpResponse) THEN begin
            HttpResponse.Content.ReadAs(ResponseText);
            Message(ResponseText);
        end;

    end;
}