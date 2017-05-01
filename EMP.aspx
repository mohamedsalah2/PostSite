<%@ Page Title="" Language="VB" MasterPageFile="~/VacMaster.master" AutoEventWireup="false"
    CodeFile="EMP.aspx.vb" Inherits="EMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
            border: 2px solid #ccffcc;
            background-color: #ffffff;
        }
        .style2
        {
            width: 479px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="EmpData" class="PageBody" align="center" style="background-color: #DDDDDD">
        <table align="center" class="style1" dir="rtl">
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                        BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
                        DataSourceID="EmpDataSource1" EmptyDataText="لا توجد بيانات" AllowPaging="True"
                        AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="EmpNo" HeaderText="رقم الملف" />
                            <asp:BoundField DataField="EmpName" HeaderText="إسم الموظف" />
                            <asp:BoundField DataField="POSETION" HeaderText="الوظيفة" />
                            <asp:BoundField DataField="ADRS" HeaderText="العنوان" />
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
                    <asp:ObjectDataSource ID="EmpDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" 
                        TypeName="DataSet1TableAdapters.EmployeeTableAdapter">
                        <SelectParameters>
                            <asp:SessionParameter Name="OfceCode" SessionField="Ofce_id" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td valign="top">
                    <asp:TextBox ID="TxtEmpNo" runat="server" style="text-align: center"></asp:TextBox>
                    <asp:GridView ID="GridView2" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan"
                        BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black"
                        GridLines="None" AllowPaging="True" AllowSorting="True" 
                        AutoGenerateColumns="False" EmptyDataText="لا توجد بيانات" 
                        HorizontalAlign="Center" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:BoundField DataField="EmpName" HeaderText="إسم الموظف" 
                                SortExpression="EmpName">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="VacType" HeaderText="نوع الأجازة" 
                                SortExpression="VacType" />
                            <asp:BoundField DataField="DDATE" HeaderText="التاريخ" SortExpression="DDATE" />
                            <asp:BoundField DataField="VacCount" HeaderText="عدد الأيام" 
                                SortExpression="VacCount" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:1KHAZINA_DBConnectionString %>" 
                        SelectCommand="SELECT [EmpNo], [EmpName], [VacType], [VacCount], [DDATE], [NOTES] FROM [VacView] WHERE ([EmpNo] = @EmpNo) ORDER BY [DDATE] DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TxtEmpNo" Name="EmpNo" PropertyName="Text" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
