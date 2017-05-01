<%@ Page Title="" Language="VB" MasterPageFile="~/VacMaster.master" AutoEventWireup="false" CodeFile="AddVac.aspx.vb" Inherits="AddVac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 100%;
        font-family: "Times New Roman", Times, serif;
        font-size: x-large;
        font-weight: 700;
        border: 2px solid #ffffff;
        background-color: #ffffff;
    }
    .style2
    {
    }
    .style3
    {
        width: 194px;
    }
    .style4
    {
        font-family: "Times New Roman", Times, serif;
        font-size: x-large;
        font-weight: bold;
        color: #000099;
    }
    .style5
    {
        color: #000099;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="PageBody" align="center" style="background-color: #DDDDDD;
        margin-top: 7px;">
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" CssClass="style5" Text="رقم الملف :"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TxtEmpNo" runat="server" CssClass="style4" Width="127px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="LinkButton1" runat="server">بحث</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" CssClass="style5" Text="إسم الموظف :"></asp:Label>
            </td>
            <td class="style2">
                <asp:Label ID="LblEmpName" runat="server" CssClass="style5"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" CssClass="style5" Text="نوع الأجازة :"></asp:Label>
            </td>
            <td class="style2" colspan="2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" style="font-size: large">
                    <asp:ListItem Value="1">إعتيادي</asp:ListItem>
                    <asp:ListItem Value="2">عارضة</asp:ListItem>
                    <asp:ListItem Value="3">بدل راحة</asp:ListItem>
                    <asp:ListItem Value="4">مرضي</asp:ListItem>
                    <asp:ListItem Value="5">سنوات سابقة</asp:ListItem>
                    <asp:ListItem Value="6">بدون مرتب</asp:ListItem>
                    <asp:ListItem Value="7">إذن</asp:ListItem>
                    <asp:ListItem Value="8">إنقطاع</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" CssClass="style5" Text="تاريخ الأجازة :"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TxtVacDate" runat="server" CssClass="style4"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" CssClass="style5" 
                    Text="عدد أيام الأجازة :"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TxtVacDaysNo" runat="server" CssClass="style4"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" CssClass="style5" Text="ملاحظات :"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="TxtNotes" runat="server" CssClass="style4"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:LinkButton ID="LinkButton2" runat="server">حفظ</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>
</asp:Content>

