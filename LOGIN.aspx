<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LOGIN.aspx.vb" Inherits="LOGIN" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>برنامج 1 خزينة الإلكتروني</title>
 <link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />

    <script language="javascript" type="text/javascript">
// <![CDATA[

      

// ]]>
    </script>
    <style type="text/css">
        .style1
        {
            font-family: "Times New Roman", Times, serif;
            font-size: medium;
        }
        </style>
</head>
<img src="images/Logo.gif" alt="Pic 1" style="width: 100%; height: 110px;">
<body style="background:  url(images/bg.jpg) repeat-x">

	<form id="form1" runat="server" >
	<div id="wrapper" >
		<div id="headline">
        <p style="text-align: center">
                &nbsp;</p>
            <p style="text-align: center">
                &nbsp;</p>
            <p style="text-align: center">
                <asp:TextBox ID="TextBox1" runat="server" Width="300px" CssClass="style1"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" 
                    style="font-size: large; font-family: 'Times New Roman', Times, serif; font-weight: bold; text-align: left;" 
                    Text=": إسم المستخدم"></asp:Label>
            </p>
            <p style="text-align: center">
                <asp:TextBox ID="TextBox2" runat="server" Width="300px" TextMode="Password" CssClass="style1"></asp:TextBox>
            &nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" 
                    style="font-size: large; font-family: 'Times New Roman', Times, serif; font-weight: bold; ; text-align: left;" 
                    Text=": كلمة المرور"></asp:Label>
            </p>
            <p style="text-align: center">
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" 
                    Font-Names="Times New Roman" Font-Size="XX-Large">دخــول</asp:LinkButton>
                &nbsp;
                </p>
            <p style="text-align: center">
                <asp:Label ID="LblErr" runat="server" ForeColor="Red" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; text-align: right"></asp:Label>
                </p>
            <p style="text-align: center">
    &nbsp;&nbsp;&nbsp; Server 10.13.25.240 </p>
            </div>
				</div>
	
    </form>
</body>
</html>
