<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Daily1MT.aspx.vb" Inherits="Daily1MT" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style6
        {
            margin-right: 0px;
            text-align: center;
            font-weight: bold;
            font-size: large;
            font-family: "Times New Roman", Times, serif;
            color: #003300;
            background-color: #00CC66;
        }
        .style7
        {
            width: 100%;
            border: 2px solid #ffffff;
            background-color: #009933;
            color: #FFFFFF;
            font-weight: 700;
            font-size: large;
            font-family: "Times New Roman", Times, serif;
        }
        .style8
        {
            font-weight: bold;
            font-size: large;
            font-family: "Times New Roman", Times, serif;
        }
        .style9
        {
            font-weight: bold;
            font-size: large;
            font-family: "Times New Roman", Times, serif;
            color: #003300;
            background-color: #00CC66;
            Height: 30px;            
        }
        .style10
        {
            height: 35px;
        }
        </style>
</head>
<body>
<form id="form1" runat="server">
   <table class="style7" dir="rtl">
    <tr>
        <td style="text-align: left" class="style10">

        
<asp:Label ID="Label3" runat="server" Text="إختار التقرير"></asp:Label>

        </td>
        <td class="style10">

 <asp:DropDownList ID="DropReport" runat="server" CssClass="style9" 
                style="text-align: center" AutoPostBack="True" Height="30px">
     <asp:ListItem Selected="True" Value="1">1خزينة</asp:ListItem>
     <asp:ListItem Value="2">1خزينة طوابع</asp:ListItem>
     <asp:ListItem Value="3">العمليات الجارية</asp:ListItem>
     <asp:ListItem Value="4">العمليات الجارية بالنسب</asp:ListItem>
     <asp:ListItem Value="5">جرد العهد والطوابع</asp:ListItem>
</asp:DropDownList>

        </td>
        <td style="text-align: left" class="style10">
            <asp:Label ID="Label2" runat="server" Text="إختار التاريخ"></asp:Label>
                    &nbsp;</td>
        <td class="style10">
    <asp:TextBox ID="TxtDate" runat="server" CssClass="style6" Width="98px" 
        Height="30px"></asp:TextBox>

       

                    <img src="cal/calender.png" alt="Click to popup the bank window!" style="width: 20px;height: 26px; margin-top: 0px" /></td>
        <td style="text-align: left" class="style10">
       <asp:Label ID="Label1" runat="server" Text="كود المكتب" Visible="False"></asp:Label>
         </td>
        <td class="style10">

        <asp:TextBox ID="txtOffice" runat="server" Height="30px" Width="16px" 
                CssClass="style9" style="text-align: center" Enabled="False" 
                Visible="False"></asp:TextBox>

        
                    <asp:Label ID="Label4" runat="server" Text="إختار المحافظة"></asp:Label>
                    <asp:DropDownList ID="DropZone" runat="server" 
                        DataSourceID="ZoneDataSource" DataTextField="AREA_NAME" 
                        DataValueField="AREA_CODE" AutoPostBack="True">
                    </asp:DropDownList>

        
        </td>
        <td class="style10">

                    <asp:Label ID="Label5" runat="server" Text="إختار المكتب"></asp:Label>
                    <asp:DropDownList ID="DropOfce1" runat="server" AutoPostBack="True" 
                        DataSourceID="OfceDataSource" DataTextField="OFCE_NAME" 
                        DataValueField="OFCE_ID" AppendDataBoundItems="True" 
                        style="margin-right: 33px">
                    </asp:DropDownList>

                           
        </td>
        <td class="style10">

   <asp:Button ID="Button1" runat="server" Text="عرض التقرير" Height="30px" 
        Width="104px" CssClass="style8" />

        
        </td>
        <td style="text-align: center" class="style10">
<asp:Button ID="BtnMAIN" runat="server" Text="الصفحة الرئيسية" Height="30px" 
        Width="120px" CssClass="style8" />
        </td>
    </tr>
</table>
&nbsp;<script src="Cal/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Cal/Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="Cal/Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="Cal/Styles/calendar-blue.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
                $(document).ready(function () {
                    $("#<%=TxtDate.ClientID %>").dynDateTime({
                        Date: 'now',
//                        showsTime: true,
//                        timeFormat: "12",
                        ifFormat: "%d/%m/%Y",     //date format that will be stored in the input field
                        daFormat: "%e/ %m/ %Y",    //the date format that will be used to display the date in displayArea
                        align: "BR",
                        //align: "TL",
                        electric: false,
                        singleClick: true,
                        displayArea: ".siblings('.dtcDisplayArea')",
                        button: ".next()",
                        allowInputToggle: true

                    });
                });

            </script><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div dir="rtl">
        <rsweb:ReportViewer ID="RV_1MT" runat="server" Font-Names="times new roman" 
            Font-Size="18pt" Height="1000px" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
            <LocalReport ReportPath="REPORTS\RPTDaily1MT.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSet1TableAdapters.new_totalTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtOffice" Name="rpOffice" PropertyName="Text" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="TxtDate" Name="rpDate" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="Twab3DataSource" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="DataSet1TableAdapters.DailyTwab3ViewTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtOffice" Name="OFCE_ID" PropertyName="Text" 
                    Type="Int32" />
                <asp:ControlParameter ControlID="TxtDate" Name="DDate" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <asp:ObjectDataSource ID="AllTwb3DataSource" runat="server" 
       OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
       TypeName="DataSet1TableAdapters.part_totalTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtOffice" Name="rpOffice" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="TxtDate" Name="rpDate" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
   </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ZoneDataSource" runat="server" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="DataSet1TableAdapters.AREASTableAdapter">
                        <InsertParameters>
                            <asp:Parameter Name="AREA_CODE" Type="Int32" />
                            <asp:Parameter Name="AREA_NAME" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="OfceDataSource" runat="server" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" 
       TypeName="DataSet1TableAdapters.OFFICESTableAdapter" InsertMethod="Insert">
                        <InsertParameters>
                            <asp:Parameter Name="OFCE_ID" Type="Double" />
                            <asp:Parameter Name="OFCE_NAME" Type="String" />
                            <asp:Parameter Name="ZoneID" Type="Int32" />
                            <asp:Parameter Name="ADDRSS" Type="String" />
                            <asp:Parameter Name="P_Code" Type="Double" />
                            <asp:Parameter Name="Tel" Type="Double" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropZone" Name="ZoneID" 
                                PropertyName="SelectedValue" Type="Int32" DefaultValue="5" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
    </form>
</body>
</html>

