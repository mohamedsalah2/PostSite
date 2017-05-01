<%@ Page Title="بيانات المكاتب" Language="VB" MasterPageFile="~/PostMaster.master" AutoEventWireup="false" CodeFile="OffceData.aspx.vb" Inherits="OffceBlnce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            border: 2px solid #ffffff;
            background-color: #ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id = "PageBody" class="PageBody" dir="rtl"> 
    
        <table class="style1" dir="rtl">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: left">
                    <asp:Label ID="Label1" runat="server" Text="إختار المحافظة"></asp:Label>
&nbsp;&nbsp; </td>
                <td>
                    <asp:DropDownList ID="DropZone" runat="server" AutoPostBack="True" 
                        DataSourceID="ZoneDataSource" DataTextField="AREA_NAME" 
                        DataValueField="AREA_CODE">
                    </asp:DropDownList>
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label2" runat="server" Text="إسم المكتب" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtOfceName" runat="server" Visible="False"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="4">
                    <asp:GridView ID="DgvOfce" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" 
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                        CellSpacing="2" DataSourceID="OfceSqlDataSource" PageSize="20" 
                        Width="1082px">
                        <Columns>
                            <asp:BoundField DataField="OFCE_ID" HeaderText="الكود المالي" 
                                SortExpression="OFCE_ID" />
                            <asp:BoundField DataField="OFCE_NAME" HeaderText="إسم المكتب" 
                                SortExpression="OFCE_NAME" />
                            <asp:BoundField DataField="ZoneID" HeaderText="ZoneID" 
                                SortExpression="ZoneID" Visible="False" />
                            <asp:BoundField DataField="ADDRSS" HeaderText="العنوان" 
                                SortExpression="ADDRSS" />
                            <asp:BoundField DataField="P_CODE" HeaderText="الرقم البريدي" 
                                SortExpression="P_CODE" />
                            <asp:BoundField DataField="TEL" HeaderText="رقم التليفون" 
                                SortExpression="TEL" />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="OfceSqlDataSource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:1KHAZINA_DBConnectionString %>" 
                        SelectCommand="SELECT * FROM [OFFICES] WHERE ([ZoneID] = @ZoneID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropZone" Name="ZoneID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="ZoneDataSource" runat="server" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="DataSet1TableAdapters.AREASTableAdapter">
                        <InsertParameters>
                            <asp:Parameter Name="AREA_CODE" Type="Int32" />
                            <asp:Parameter Name="AREA_NAME" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    <br />
    <br />

    </div>
</asp:Content>

