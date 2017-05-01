<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MainBigen.aspx.vb" Inherits="MainBigen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            font-size: large;
            border: 2px solid #FFFFFF;
            background-color: #ffffff;
        }
        .style2
        {
            width: 638px;
        }
        .style3
        {
            font-size: x-large;
            font-weight: bold;
            font-family: "Times New Roman" , Times, serif;
        }
    </style>
    <img src="images/Login22.gif" alt="Pic 1" style="width: 100%; height: 110px;">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center" class="style1" dir="rtl">
            <tr>
                <td class="style2">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2" style="text-align: center">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="style3">1 خزينة (1 م ت)</asp:LinkButton>
                </td>
                <td style="text-align: center">
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="style3">الأجازات</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
