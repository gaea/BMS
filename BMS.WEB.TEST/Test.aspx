<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="BMS.WEB.TEST.Test" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>BMS TEST</title>
    <link rel="stylesheet" type="text/css"  href="lib/extjs/resources/css/ext-all.css" />
    <script type="text/javascript" src="lib/extjs/ext-all.js"></script>
    <script type="text/javascript" src="lib/extjs/locale/ext-lang-es.js"></script>
    <!--<script type="text/javascript" src="js/Maestras.js"></script>-->
     <script type="text/javascript">
         function CallMethod() {
             GetTime();
         }

         function GetTime() {

             PageMethods.GetTime(GetTimeCallback, ErrorHandler, TimeOutHandler);


         }
         function TimeOutHandler(result) {
             alert("Timeout :" + result);
         }
         /// <summary>
         /// Callback function invoked on failure of the page method 
         /// </summary>

         function ErrorHandler(result) {
             var msg = result.get_exceptionType() + "\r\n";
             msg += result.get_message() + "\r\n";
             msg += result.get_stackTrace();
             alert(msg);
         }
         GetTimeCallback = function(result) {
             /// <summary>
             /// Is called when server sent result back
             /// </summary>
             /// <param name="result">
             /// Result of calling server method, 
             /// string - server time 
             /// </param>
             if (result) {
                 $get("resultDiv").innerHTML = result;
             }
         }
   </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager 
        EnablePageMethods="true" 
        ID="MainSM" 
        runat="server" 
        ScriptMode="Release" 
        LoadScriptsBeforeUI="true">
        <Scripts>
            <asp:ScriptReference Path="~/js/Maestras.js" />
        </Scripts>
    </asp:ScriptManager>
    </form>
</body>
</html>
