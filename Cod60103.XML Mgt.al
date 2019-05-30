codeunit 60103 "XML Mgt."
{
    trigger OnRun()
    begin
        UploadIntoStream('Choose one xml file', '', '', FileName, InStreamVar);
        XmlDocument.ReadFrom(InStreamVar, Doc);
        IF Doc.SelectSingleNode('//glAccountTable', Node1) THEN begin
            NodeList := Node1.AsXmlElement().GetChildElements();
            MESSAGE('Number of elemens: %1, Node Name: %2', NodeList.COUNT());
        END;
    end;

    var
        Doc: XmlDocument;
        NodeList: XmlNodeList;
        Node1: XmlNode;
        InStreamVar: InStream;
        FileName: text;
}