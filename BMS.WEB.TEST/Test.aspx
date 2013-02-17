<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="BMS.WEB.TEST.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>BMS TEST</title>
        <link rel="stylesheet" type="text/css"  href="lib/extjs/resources/css/ext-all.css" />
        <script type="text/javascript" src="lib/extjs/ext-all.js"></script>
        <script type="text/javascript" src="lib/extjs/locale/ext-lang-es.js"></script>
    </head>
    <body>
        <form id="UserForm" runat="server">
            <asp:ScriptManager 
                EnablePageMethods="true" 
                ID="MainUserSM" 
                runat="server" 
                ScriptMode="Release" 
                LoadScriptsBeforeUI="true">
                <Scripts>
                    <asp:ScriptReference Path="~/js/Functions.js" />
                    <asp:ScriptReference Path="~/js/User.js" />
                </Scripts>
            </asp:ScriptManager>
        </form>
    </body>
</html>
