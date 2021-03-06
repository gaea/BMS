﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BMS.WEB.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Sistema de Gestión Biometrica</title>
        <link rel="stylesheet" type="text/css"  href="../../lib/extjs/resources/css/ext-all.css" />
        <link rel="stylesheet" type="text/css"  href="../../css/icons.css" />
        <script type="text/javascript" src="../../lib/extjs/ext-all.js"></script>
        <script type="text/javascript" src="../../lib/extjs/locale/ext-lang-es.js"></script>
        <script type="text/javascript" src="../../lib/extjs/locale/ext-lang-es.js"></script>
    </head>
    <body style="background-color:#F2F2F2;">
        <table width="50%" height="50%" border="0" align="center" style="margin-top:100px;">
            <tr>
                <td align="center" height="100px" width="60%">
                    <font face="arial" size="6px" color="#4E79B2">Sistema de Gestión Biometrica</font>
                </td>
            </tr>
            <tr align="center" width="50%">
                <td width="50%">
                    <div id="autenticacion"/>
                </td>
            </tr>
        </table>
    
        <form id="UserForm" runat="server">
            <asp:ScriptManager 
                EnablePageMethods="true" 
                ID="MainUserSM" 
                runat="server" 
                ScriptMode="Release" 
                LoadScriptsBeforeUI="true">
                <Scripts>
                    <asp:ScriptReference Path="~/js/Functions.js" />
                    <asp:ScriptReference Path="~/js/modules/login/Login.js" />
                </Scripts>
            </asp:ScriptManager>
        </form>
    </body>
</html>
