<%@ Page Title="تسجيل الحسابات اليومية" Language="VB" MasterPageFile="~/PostMaster.master"
    AutoEventWireup="false" CodeFile="DailyAccc.aspx.vb" Inherits="DailyAccc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style6
        {
            margin-right: 0px;
            font-weight: 700;
            font-size: large;
            color: #003300;
            text-align: center;
        }
        .style7
        {
            width: 80%;
            border: 2px solid #ccffcc;
            background-color: #ffffff;
        }
        .style13
        {
            margin-right: 0px;
            font-size: medium;
            font-weight: bold;
        }
        .style15
        {
            font-size: medium;
        }
        .style17
        {
            height: 110px;
            width: 40%;
        }
        .style21
        {
            text-align: center;
            width: 184px;
        }
        .style22
        {
            height: 110px;
            width: 60%;
        }
        .style23
        {
            text-align: center;
            width: 325px;
        }
         .style24
    {
            margin-right: 0px;
            font-family: "Times New Roman", Times, serif;
            font-size: x-large;
            font-weight: bold;
            color: #003300;
            width:15%
        }
    .style25
    {
            font-family: "Times New Roman", Times, serif;
            font-size: x-large;
            font-weight: bold;
            color: #FFFFFF;
        }
        .style27
        {
            color: #FFFFFF;
        }
        .style32
        {
            width: 100%;
            border: 2px solid #ffffff;
            background-color: #00FF99;
        }
        .style33
        {
            width: 404px;
        }
        .style35
        {
            font-size: x-large;
        }
        .style36
        {
            width: 100%;
            border: 2px solid #ffffff;
            background-color: #009933;
        }
        .style37
        {
            width: 18%;
        }
        .style38
        {
            width:18%;
        }
        .style39
        {
            width: 18%;
        }
        .style40
        {
            width: 36%;
        }
        .style41
        {
            width: 482px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="DailyACCC" class="PageBody" align="center" style="background-color: #DDDDDD;
        margin-top: 7px;" dir="rtl">
        <asp:Menu ID="Menu1" runat="server" BackColor="#FFFBD6" DynamicHorizontalOffset="2"
            Font-Names="Times New Roman" Font-Overline="False" Font-Size="Medium" ForeColor="#990000"
            StaticSubMenuIndent="6px" Style="font-family: 'Times New Roman'; font-size: xx-large;
            text-decoration: underline; text-align: center; font-weight: 700;" Orientation="Horizontal"
            ItemWrap="True" RenderingMode="List">
            <DynamicHoverStyle BackColor="#990000" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#FFFBD6" />
            <DynamicSelectedStyle BackColor="#FFCC66" />
            <DynamicItemTemplate>
                <%# Eval("Text") %>
            </DynamicItemTemplate>
            <Items>
                <asp:MenuItem Text="الشباك الموحد" Value="الشباك الموحد" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="التوفير" Value="التوفير">
                        <asp:MenuItem Text="حــ 7 إيداع التوفير" Value="32"></asp:MenuItem>
                        <asp:MenuItem Text="حــ 43 سحب التوفير" Value="71"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="جاري بدون عائد" Value="جاري بدون عائد">
                        <asp:MenuItem Text="حـ 12 ايداع شيكات بريدية" Value="33"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 4 اجرة الشيكات" Value="13"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/51 صرف شيكات بريدية" Value="72"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 12 ايداع حساب جاري بدون عائد" Value="100"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/51 صرف حساب جاري بدون عائد" Value="101"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/51 حوالات الأزهر" Value="102"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/51 مصر الخير" Value="103"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="جاري ذهبي" Value="جاري ذهبي">
                        <asp:MenuItem Text="حـ1/12 ايداع حساب ذهبي" Value="34"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 2/51 سحب شيكات ذهبي" Value="73"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 4/4 اجرة الحساب الذهبي" Value="14"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="جاري فضي" Value="جاري فضي">
                        <asp:MenuItem Text="حـ2/12 ايداع حساب فضي" Value="35"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 3/51سحب شيكات فضي" Value="74"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 5/4 اجرة الحساب الفضي" Value="15"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="خدمة فوري" Value="خدمة فوري">
                        <asp:MenuItem Text="حـ 17 خدمة فوري" Value="48"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 28/6 رسوم شحن فوري" Value="9"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="شركة الاسمنت" Value="99">
                        <asp:MenuItem Text="حـ 3/12 ايداع شركة الاسمنت" Value="99"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/4/6 رسوم شركة الاسمنت" Value="حـ 1/4/6 رسوم شركة الاسمنت">
                        </asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="POS" Value="POS" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="حـ 20 نقاط البيع" Value="45"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 67 نقاط البيع" Value="87"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="الحوالات" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="حوالات فورية" Value="حوالات فورية">
                        <asp:MenuItem Text="حــ 9 فوري سحب حوالات داخلية فورية" Value="37"></asp:MenuItem>
                        <asp:MenuItem Text="حــ 1 فوري اجرة الحوالات الفورية" Value="17"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 46 فوري صرف الحوالات الداخلية الفوري" Value="76"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/51 حوالات وافية المدة فوري" Value="79"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="حوالات عادية" Value="حوالات عادية">
                        <asp:MenuItem Text="حـ 1 اجرة الحوالات العادية" Value="16"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 9 سحب حوالات داخلية" Value="36"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 46 صرف الحوالات الداخلية" Value="75"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 51 حوالات وافية المدة" Value="78"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="حوالات حكومية" Value="حوالات حكومية">
                        <asp:MenuItem Text="حـ1/1 اجرة المتحصل (حوالات حكومية)" Value="23"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 30حوالات حكومية" Value="47"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="حـ 57 حوالات خارجية مصروفة" Value="77"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="المعاشات" Value="المعاشات" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="معاشات مميكنة" Value="89"></asp:MenuItem>
                    <asp:MenuItem Text="حــ 62 الرقم التأميني" Value="80"></asp:MenuItem>
                    <asp:MenuItem Text="حــ 66 العسكريين والتمريض والمقاولون العرب" Value="85"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 63 معاشات التامينات الاجتماعية" Value="81"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 1/63 معاشات السادات" Value="82"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 1/64 معاشات الحكومة" Value="83"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 4/64 معاشات مجلس الوزراء" Value="84"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 8/6 المصاريف الادارية معاشات" Value="19"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="البريد السريع" Value="البريد السريع" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="نقدي" Value="نقدي">
                        <asp:MenuItem Text="حـ 3/6م اجره بريد سريع" Value="7"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/25م تأمين بريد سريع" Value="30"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/8م ضريبة البريد السريع نقدي" Value="61"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="آجل" Value="آجل">
                        <asp:MenuItem Text="حـ 1/3/6م اجره بريد سريع  اجل" Value="8"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/1/25م تأمين بريد سريع الأجل" Value="9"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 1/1/8م ضريبة البريد السريع اجل" Value="62"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 40م اجره بريد سريع محلي اجل" Value="69"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 40ت م تامين سريع محلي اجل" Value="70"></asp:MenuItem>
                        <asp:MenuItem Text="حـ 2/41 ضريبة السريع محلي اجل" Value="92"></asp:MenuItem>
                    </asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="حــ6" Value="حــ6" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="حـ 14/6 أجرة التوكيل البريدي" Value="5"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 2/6 رسم تخليص بالاله" Value="6"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 5/6 اشتراكات الصناديق المخصوصة" Value="10"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 6/6 اجرة البريد الدعائي" Value="11"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 12/6 رسوم اشتراك جائزة الربع مليون" Value="12"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 18/6 اجرة الدفع الالكتروني" Value="20"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 22/6 اجرة بدل تالف وفاقد" Value="22"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 6 ايرادات متنوعة" Value="28"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 6 درن ايراد محصل لجهة خارجية" Value="29"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 29/6 اجرة المسائي" Value="104"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="الصر (المؤمنات)" SeparatorImageUrl="images/menu_separator.jpg"
                    Value="الصر (المؤمنات)">
                    <asp:MenuItem Text="حـ 33 الصر النقدي الوارد" Value="63"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 72 الصر النقدي الصادر" Value="93"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="الطوابع" Value="stamp" SeparatorImageUrl="images/menu_separator.jpg"
                    Enabled="False">
                    <asp:MenuItem Text="طوابع" Value="طوابع">
                        <asp:MenuItem Text="عادية" Value="1"></asp:MenuItem>
                        <asp:MenuItem Text="تذكارية" Value="2"></asp:MenuItem>
                        <asp:MenuItem Text="حكومية" Value="3"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="أظرف بريد سريع" Value="5"></asp:MenuItem>
                    <asp:MenuItem Text="كرتون سريع" Value="6"></asp:MenuItem>
                    <asp:MenuItem Text="أظرف بجميع أنواعها" Value="7"></asp:MenuItem>
                    <asp:MenuItem Text="الحوالات" Value="8"></asp:MenuItem>
                    <asp:MenuItem Text="ذمة مالية" Value="9"></asp:MenuItem>
                    <asp:MenuItem Text="دعم المشروعات" Value="10"></asp:MenuItem>
                    <asp:MenuItem Text="أمومة وطفولة" Value="11"></asp:MenuItem>
                    <asp:MenuItem Text="خيري" Value="12"></asp:MenuItem>
                    <asp:MenuItem Text="دمغة" Value="13"></asp:MenuItem>
                    <asp:MenuItem Text="تنمية الموارد" Value="14"></asp:MenuItem>
                    <asp:MenuItem Text="سجل" Value="15"></asp:MenuItem>
                    <asp:MenuItem Text="تجنيد" Value="16"></asp:MenuItem>
                    <asp:MenuItem Text="مرور1" Value="17"></asp:MenuItem>
                    <asp:MenuItem Text="هندسية" Value="18"></asp:MenuItem>
                    <asp:MenuItem Text="طبية" Value="19"></asp:MenuItem>
                    <asp:MenuItem Text="تأمين صحي" Value="20"></asp:MenuItem>
                    <asp:MenuItem Text="تأمين علي الطفل" Value="21"></asp:MenuItem>
                    <asp:MenuItem Text="مهن تطبيقية" Value="22"></asp:MenuItem>
                    <asp:MenuItem Text="م فنون تطبيقية" Value="23"></asp:MenuItem>
                    <asp:MenuItem Text="م فنون تشكيلية" Value="24"></asp:MenuItem>
                    <asp:MenuItem Text="زراعية" Value="25"></asp:MenuItem>
                    <asp:MenuItem Text="مهن تعليمية" Value="26"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="الطرود" Value="الطرود" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="حـ 1/3 اجرة طرود محصلة" Value="18"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 5 اجرة اجراءات جمركية" Value="25"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 2/5 اجرة توصيل الطرود للمنازل" Value="26"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 3/5 اجرة طرود تبادل المطار" Value="27"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 11 تحصيل قيم محول بها" Value="38"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 22 رسوم جمركية علي الطرود" Value="59"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 2/22 رسوم جمركية علي الطرود الخارجية" Value="60"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="تراخيص المرور" SeparatorImageUrl="images/menu_separator.jpg"
                    Value="تراخيص المرور">
                    <asp:MenuItem Text="حـ 2/4 اجرة تراخيص السيارات" Value="24"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 15 تراخيص المرور" Value="57"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="حسابات أخري" Value="حسابات أخري" SeparatorImageUrl="images/menu_separator.jpg">
                    <asp:MenuItem Text="حـ 68 المنصرف لمصالح اخر" Value="88"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 44 الاذون المصلحية المصروفة" Value="86"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 25 امانات وعهد" Value="65"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 27 تسويات" Value="66"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 76 التسويات" Value="95"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 38 تحصيل فواتير التليفون" Value="56"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 60 تخليص بشيكات" Value="68"></asp:MenuItem>
                    <asp:MenuItem Text="حـ 65 طوابع حكومية بشيكات" Value="96"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#990000" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#FFCC66" />
            <StaticItemTemplate>
                <%# Eval("Text") %>
            </StaticItemTemplate>
        </asp:Menu>
        <table class="style32" dir="rtl">
            <tr>
                <td class="style33">
                    <span class="dtcDisplayArea"><strong><span class="style35">برجاء إختيار التاريخ</span></strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <script src="Cal/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
            <script src="Cal/Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
            <script src="Cal/Scripts/calendar-en.min.js" type="text/javascript"></script>
            <link href="Cal/Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#<%=TxtDate.ClientID %>").dynDateTime({
                        Date: 'now',
                        showsTime: true,
                        timeFormat: "12",
                        ifFormat: "%d/%m/%Y",     //date format that will be stored in the input field
                        daFormat: "%e/ %m/ %Y",    //the date format that will be used to display the date in displayArea
                        align: "BR",
                        //          align: "TL",
                        electric: false,
                        singleClick: true,
                        displayArea: ".siblings('.dtcDisplayArea')",
                        button: ".next()",
                        allowInputToggle: true

                    });
                });

            </script>
            &nbsp;&nbsp;
            <asp:TextBox ID="TxtDate" runat="server" CssClass="style6" Width="157px" Height="22px"></asp:TextBox>
            <img src="cal/calender.png" alt="Click to popup the bank window!" style="width: 20px;
                height: 26px; margin-top: 0px" /></span></td>
                <td class="style41">
        <asp:Button ID="BtnModfy" runat="server" CssClass="style24" Height="35px"
                            Text="عرض اليومية السابقة" Width="190px" />
                </td>
                <td>
        <span class="dtcDisplayArea">
            <asp:CheckBox ID="CheckBox1" runat="server" Text="الطوابع" AutoPostBack="True" 
                        style="font-weight: 700; font-size: x-large; color: #003300" />
        </span>
                </td>
            </tr>
        </table>
        <div style="clear: both">

            <table class="style36" dir="rtl">
                <tr>
                    <td class="style40">
                        <asp:Label ID="LblAccNme" runat="server" CssClass="style25" ForeColor="Maroon"></asp:Label>
                        <asp:Label ID="LblAccNum" runat="server" BorderStyle="Double" 
                            CssClass="style27"></asp:Label>
                        <asp:Label ID="LblTwb3ID" 
                            runat="server" CssClass="style27"></asp:Label>
                        <asp:Button ID="Button2" runat="server" CssClass="style24" Height="35px"
                            Text="حفظ" Width="67px" />
                        </td>
                    <td class="style39">
                        <asp:Label ID="Label4" runat="server" Text="العدد : " CssClass="style25"></asp:Label>
                        <asp:TextBox ID="TxtCount" runat="server" CssClass="style24" Width="49px"></asp:TextBox>
                     </td>
                    <td class="style38">
                        <asp:Label ID="Label5" runat="server" Text="المبلغ :" CssClass="style25"></asp:Label>
                        <asp:TextBox ID="TxtAmount" runat="server" CssClass="style24" Width="59px"></asp:TextBox>
                     </td>
                    <td class="style37">
                        <asp:Label ID="Label13" runat="server" Text="المباع :"
                            Visible="False" CssClass="style25"></asp:Label>
                        <asp:TextBox ID="TxtSell" runat="server" CssClass="style24" Width="59px" 
                            Visible="False"></asp:TextBox>
                     </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" CssClass="style24" Height="35px"
                            Text="حفظ" Width="67px" />
                     </td>
                </tr>
            </table>

              <table class="style7" dir="rtl" style=" background-image : url(Images\11); margin-top: 7px;
                 height:auto; width:100%">
                <tr>
                   <td align="justify" valign="top" class="style22" colspan="3">
                        <asp:GridView ID="DGV1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                            CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" 
                            Height="16px" 
                            
                            Style="font-family: 'Times New Roman', Times, serif;
                            font-size: x-large; margin-top: 0PX; margin-left: 0px; Width:98%; text-align: center;" EmptyDataText="لا يوجد بيانات"
                            ShowHeaderWhenEmpty="True" Font-Names="Times New Roman" Font-Size="X-Large" 
                            PageSize="20" DataKeyNames="ACC_ID">
                                  <Columns>
                                      <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True"/>
                                <asp:BoundField DataField="ACC_ID" HeaderText="كود الحساب" SortExpression="ACC_ID" 
                                          ReadOnly="True" />
                                <asp:BoundField DataField="ACC_NAME" HeaderText="اسم الحساب" 
                                          SortExpression="ACC_NAME" ReadOnly="True" />
                                <asp:BoundField DataField="ACC_NUM" HeaderText="رقم الحساب" SortExpression="ACC_NUM" 
                                          ReadOnly="True">
                                </asp:BoundField>
                                <asp:BoundField DataField="CCOUNT" HeaderText="العدد" SortExpression="CCOUNT"></asp:BoundField>
                                <asp:BoundField DataField="AMOUNT" HeaderText="القيمه" SortExpression="AMOUNT" />
                                <asp:BoundField DataField="DDATE" HeaderText="التاريخ" SortExpression="DDATE" Visible="False" />
                                      <asp:TemplateField ShowHeader="False">
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                  CommandName="Delete" Text="حذف" OnClientClick="return confirm('هل انت متأكد من  حذف البيانات؟ لا يمكن الرجوع'); "></asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField ShowHeader="False">
                                          <EditItemTemplate>
                                              <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                                                  CommandName="Update" Text="تحديث"  OnClientClick="return confirm('هل انت متأكد من  تحديث البيانات؟'); "></asp:LinkButton>
                                              &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                  CommandName="Cancel" Text="الغاء"></asp:LinkButton>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                                  CommandName="Edit" Text="تعديل"></asp:LinkButton>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                            </Columns>
                            <EditRowStyle Font-Size="Medium" />
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Font-Size="Medium" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1KHAZINA_DBConnectionString %>"
                            SelectCommand="SELECT OFCE_NAME, OFCE_ID, ACC_NUM, CCOUNT, ACC_NAME, AMOUNT, DDATE, ID, CATEGORY, ACC_ID FROM DailyData WHERE (OFCE_ID = @OFCE_ID) AND (CONVERT (VARCHAR(12), DDATE, 103) = @DDATE) ORDER BY ID DESC"
                            
                            DeleteCommand="DELETE FROM ACC_D WHERE (ACC_ID = @ACC_ID )" 
                            
                            UpdateCommand="UPDATE ACC_D SET CCOUNT = @CCOUNT, AMOUNT = @AMOUNT WHERE  (ACC_ID = @ACC_ID )">
                            <DeleteParameters>
                                <asp:Parameter Name="ACC_ID" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="OFCE_ID" SessionField="OFCE_ID" Type="Int32" />
                                <asp:ControlParameter ControlID="TxtDate" DbType="DateTime2" Name="DDATE" 
                                    PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CCOUNT" />
                                <asp:Parameter Name="AMOUNT" />
                                <asp:Parameter Name="ACC_ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                   <td align="justify" valign="top" class="style17" colspan="3">
                        <asp:GridView ID="DGV2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                            CellPadding="3" CellSpacing="2" DataKeyNames="ITM_ID,OFCE_ID,DDATE" DataSourceID="TWAB3"
                            Height="18px" Style="font-family: 'Times New Roman', Times, serif; font-size: xx-large;
                            margin-top: 0PX; text-align: center; width:100% " 
                            EmptyDataText="لا يوجد بيانات" ShowHeaderWhenEmpty="True"
                            Font-Size="Medium" PageSize="20">
                            <Columns>
                                <asp:BoundField DataField="ITM_ID" HeaderText="ITM_ID" ReadOnly="True" 
                                    SortExpression="ITM_ID" />
                                <asp:BoundField DataField="ITM_NAME" HeaderText="النوع" SortExpression="TYPE" />
                                <asp:BoundField DataField="ITM_IN" HeaderText="الوارد" SortExpression="ITM_IN"></asp:BoundField>
                                <asp:BoundField DataField="ITM_OUT" HeaderText="المرتد" SortExpression="ITM_OUT" />
                                <asp:BoundField DataField="SELL" HeaderText="المباع" SortExpression="SELL" />
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                    DeleteText="خذف" EditText="تعديل" />
                            </Columns>
                            <EditRowStyle Font-Size="Medium" />
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" Font-Size="Medium" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Font-Size="Medium" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="TWAB3" runat="server" ConnectionString="<%$ ConnectionStrings:1KHAZINA_DBConnectionString %>"
                            DeleteCommand="DELETE FROM [PART1] WHERE [ID] = @ID" InsertCommand="INSERT INTO [PART1] ([ID], [ITM_IN], [ITM_OUT], [SELL]) VALUES (@ID, @ITM_IN, @ITM_OUT, @SELL)"
                            SelectCommand="SELECT ITM_ID, ITM_NAME, ITM_IN, ITM_OUT, SELL, OFCE_ID, DDATE FROM Twab3View WHERE (CONVERT (VARCHAR(12), DDATE, 103) = @DDATE) AND (OFCE_ID = @OFCE_ID) ORDER BY DDATE DESC"
                            
                            
                            UpdateCommand="UPDATE [PART1] SET [ITM_IN] = @ITM_IN, [ITM_OUT] = @ITM_OUT, [SELL] = @SELL WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                                <asp:Parameter Name="ITM_IN" Type="Double" />
                                <asp:Parameter Name="ITM_OUT" Type="Double" />
                                <asp:Parameter Name="SELL" Type="Double" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="TxtDate" DbType="DateTime2" Name="DDATE" PropertyName="Text" />
                                <asp:SessionParameter Name="OFCE_ID" SessionField="OFCE_ID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ITM_IN" Type="Double" />
                                <asp:Parameter Name="ITM_OUT" Type="Double" />
                                <asp:Parameter Name="SELL" Type="Double" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td align="justify" valign="top" style="font-size: x-large; font-weight: 700; text-align: center;"
                        class="style23" colspan="3">
                        <asp:Label ID="Label6" runat="server" Text="الإيراد اليومي" CssClass="style15"></asp:Label>
                        &nbsp;<asp:TextBox ID="TxtErad" runat="server" CssClass="style13"
                            Width="116px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="الــمقبوضــات" CssClass="style15"></asp:Label>
                        &nbsp;<asp:TextBox ID="TxtMakbodat" runat="server" CssClass="style13" Width="115px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="نقدية أول المدة" CssClass="style15"></asp:Label>
                        &nbsp;<asp:TextBox ID="TxtFrst" runat="server" CssClass="style13" Width="107px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="الإجمالي العام" CssClass="style15"></asp:Label>
                        &nbsp;<asp:TextBox ID="TxtTotalMK" runat="server" CssClass="style13" Width="110px"></asp:TextBox>
                        <br />
                    </td>
                    <td align="center" valign="top" style="font-size: x-large; font-weight: 700; text-align: center;"
                        class="style21" colspan="3">
                        <asp:Label ID="Label3" runat="server" Text="المدفوعات" CssClass="style15"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TxtMdfo3at" runat="server" CssClass="style13" Width="108px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="نقدية أخر المدة" CssClass="style15"></asp:Label>
                        &nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="TxtLast" runat="server" CssClass="style13" Height="26px" Width="110px"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text="الإجمالي العام" CssClass="style15"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TxtTotalMD" runat="server" CssClass="style13" Width="110px"></asp:TextBox>
                        <br />
                        <br />
                    </td>
                </tr>
                </table>
        </div>
    </div>
</asp:Content>
