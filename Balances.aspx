<%@ Page Title="" Language="VB" MasterPageFile="~/PostMaster.master" AutoEventWireup="false" CodeFile="Balances.aspx.vb" Inherits="Balances" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 100%;
        text-align: center;
        border: 2px solid #ffffff;
        background-color: #ffffff;
    }
    .style2
    {
        height: 45px;
    }
    .style3
    {
        height: 45px;
        width: 347px;
    }
    .style4
    {        text-align: left;
    }
    .style5
    {
        height: 45px;
        width: 308px;
    }
    .style6
    {
        width: 308px;
        text-align: center;
    }
    .style7
    {
        text-align: left;
    }
    .style8
    {
        text-align: left;
        height: 32px;
    }
    .style9
    {
        width: 308px;
        height: 32px;
    }
    .style10
    {
        height: 32px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" dir="rtl">
    <tr>
        <td class="style3">
        </td>
        <td class="style5">
        </td>
        <td class="style2">
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="مكتب بريد :"></asp:Label>
        </td>
        <td class="style9">
            <asp:Label ID="LblOfceID" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: x-large; font-weight: 700; color: #660066;" 
                Text="مكتب بريد :"></asp:Label>
        </td>
        <td class="style10">
            </td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="رصيد الطوابع الحكومية :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtGov" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="الرصيد النقدي للمكتب :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtRasid" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="رصيد الطوابع العادية :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtStamps" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="رصيد المهنية والكروت :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtCards" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="رصيد الدمغة والإستمارات :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtEstmarat" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="نقدية أول المدة :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtFrstMony" runat="server" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="#000099" 
                style="font-family: 'Times New Roman', Times, serif; font-size: large; font-weight: 700" 
                Text="نقدية الـ ATM :"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtAtm" runat="server" 
                style="font-family: 'Times New Roman'; font-size: large; font-weight: 700; color: #800000; text-align: center;" 
                Width="221px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td class="style4">
            <asp:LinkButton ID="LinkButton1" runat="server" 
                style="font-family: 'Times New Roman'; font-size: xx-large; font-weight: 700">حفظ</asp:LinkButton>
        </td>
        <td class="style4">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

