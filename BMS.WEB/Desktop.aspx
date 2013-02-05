<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Desktop.aspx.cs" Inherits="BMS.WEB.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Intelisoft</title>
    <link rel="stylesheet" type="text/css" href="lib/extjs/resources/css/ext-all.css" />
    <link rel="stylesheet" type="text/css" href="css/desktop.css" />

    <script type="text/javascript" src="lib/extjs/ext.js"></script>

    <script type="text/javascript">
			Ext.Loader.setPath({
				'Ext.ux.desktop': 'js',
				MyDesktop: ''
			});

			Ext.require('MyDesktop.App');

			var myDesktopApp;
			Ext.onReady(function () {
				myDesktopApp = new MyDesktop.App();
			});
		</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
