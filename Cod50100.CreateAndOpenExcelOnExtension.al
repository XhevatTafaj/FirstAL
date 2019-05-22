Codeunit 50100 CreateAndOpenExcelOnExtension
{
    procedure CreateExcelHeader()
    var
    begin
        ExcelBufferTemp.RESET;
        ExcelBufferTemp.DeleteAll();
        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No." + 2, 2);
        ExcelBufferTemp.AddColumn(FORMAT('T.H1y'), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No.", ExcelBufferTemp."Column No." + 1);
        ExcelBufferTemp.AddColumn(FORMAT('T.H2'), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No.", ExcelBufferTemp."Column No." + 2);
        ExcelBufferTemp.AddColumn(FORMAT('T.H3'), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No.", ExcelBufferTemp."Column No." + 5);
        ExcelBufferTemp.AddColumn(FORMAT('T.H3'), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No.", ExcelBufferTemp."Column No." + 5);
        ExcelBufferTemp.AddColumn(FORMAT('T.h4'), FALSE, '', TRUE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);

        ExcelBufferTemp.SetCurrent(ExcelBufferTemp."Row No." + 1, 1);
        ExcelBufferTemp.AddColumn(FORMAT('H1'), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.AddColumn(FORMAT('H2'), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.AddColumn(FORMAT('H3'), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        ExcelBufferTemp.AddColumn(FORMAT('H4'), FALSE, '', FALSE, FALSE, FALSE, '', ExcelBufferTemp."Cell Type"::Text);
        //CreateExcelBook;
    end;

    procedure CreateExcelBook()
    begin
        ExcelBufferTemp.SetFriendlyFilename('Sales Book');
        ExcelBufferTemp.CreateNewBook('Sheet1');
        ExcelBufferTemp.WriteSheet('', COMPANYNAME, USERID);
        ExcelBufferTemp.CloseBook;
        ExcelBufferTemp.OpenExcel;
        ExcelBufferTemp.DELETEALL;
    end;

    var
        ExcelBufferTemp: Record "Excel Buffer" temporary;
}