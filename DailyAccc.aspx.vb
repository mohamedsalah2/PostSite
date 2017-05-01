Imports System.Data
Imports System.Data.SqlClient


Partial Class DailyAccc
    Inherits System.Web.UI.Page

    Public SumClass1 As New SumClass

    Dim EDT As String = "FALSE"


    Public Sub Insert_ACC_D(ByVal ID As Integer, ByVal OFCE_ID As Integer, ByVal ACC_ID As Integer, ByVal CCOUNT As Integer, ByVal AMOUNT As Single, ByVal DDATE As Date)
        Dim CMD As New SqlCommand("Insert Into ACC_D(ID,  OFCE_ID, ACC_ID, CCOUNT, AMOUNT, DDATE)Values(@ID,  @OFCE_ID, @ACC_ID, @CCOUNT, @AMOUNT, @DDATE)", SumClass1.Conn)
        With CMD.Parameters
            .Add("ID", SqlDbType.Int).Value = ID
            .Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
            .Add("ACC_ID", SqlDbType.Int).Value = ACC_ID
            .Add("CCOUNT", SqlDbType.Int).Value = CCOUNT
            .Add("AMOUNT", SqlDbType.Decimal).Value = AMOUNT
            .Add("DDATE", SqlDbType.DateTime2).Value = DDATE
        End With
        If SumClass1.Conn.State = ConnectionState.Open Then SumClass1.Conn.Close()
        SumClass1.Conn.Open()
        CMD.ExecuteNonQuery()
        SumClass1.Conn.Close()
        CMD = Nothing
    End Sub

    'تعديل الطوابع في الداتاجريد1

    Public Sub Update_ACC_D_FromTwab3(ByVal AMOUNT As Decimal, ByVal ID2 As Integer)

        Dim CMD As New SqlCommand("Update ACC_D Set AMOUNT =@AMOUNT Where ID= @ID2", SumClass1.Conn)

        With CMD.Parameters
            .Add("AMOUNT", SqlDbType.Decimal).Value = AMOUNT
            .Add("ID2", SqlDbType.Int).Value = ID2

        End With
        If SumClass1.Conn.State = ConnectionState.Open Then SumClass1.Conn.Close()
        SumClass1.Conn.Open()
        CMD.ExecuteNonQuery()
        SumClass1.Conn.Close()
        CMD = Nothing
    End Sub

    Public Sub Insert_PART1(ByVal ID As Integer, ByVal ITM_ID As String, ByVal ITM_IN As String, ByVal ITM_OUT As String, ByVal SELL As String, ByVal OFCE_ID As String, ByVal DDATE As Date)

        Dim CMD As New SqlCommand("Insert Into PART1(ID, ITM_ID, ITM_IN, ITM_OUT, SELL, OFCE_ID, DDATE)Values(@ID, @ITM_ID, @ITM_IN, @ITM_OUT, @SELL, @OFCE_ID, @DDATE)", SumClass1.Conn)

        With CMD.Parameters
            .Add("ID", SqlDbType.Int).Value = ID
            .Add("ITM_ID", SqlDbType.VarChar).Value = ITM_ID
            .Add("ITM_IN", SqlDbType.VarChar).Value = ITM_IN
            .Add("ITM_OUT", SqlDbType.VarChar).Value = ITM_OUT
            .Add("SELL", SqlDbType.VarChar).Value = SELL
            .Add("OFCE_ID", SqlDbType.VarChar).Value = OFCE_ID
            .Add("DDATE", SqlDbType.DateTime2).Value = DDATE
        End With
        If SumClass1.Conn.State = ConnectionState.Open Then SumClass1.Conn.Close()
        SumClass1.Conn.Open()
        CMD.ExecuteNonQuery()
        SumClass1.Conn.Close()
        CMD = Nothing
    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            TxtDate.Text = SumClass1.S_date

            SumClass1.Load_DailyData(TxtDate.Text, Session("OFCE_ID"))
            SumClass1.SumAmountFrst1(Session("ofce_id"))

            TxtErad.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 2)
            TxtMakbodat.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 3)
            TxtMdfo3at.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 4)

            SumClass1.SumAmountFrst1(Session("ofce_id"))

            If SumClass1.OFFCE_BALNCE_DT.Rows.Count > 0 Then
                TxtFrst.Text = SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("FRSTMONY") + (SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 2) + SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 3)) - SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 4)
                TxtTotalMK.Text = Val(TxtErad.Text) + Val(TxtMakbodat.Text) + Val(TxtFrst.Text)
                TxtLast.Text = (Val(TxtErad.Text) + Val(TxtMakbodat.Text) + Val(TxtFrst.Text)) - Val(TxtMdfo3at.Text)
                TxtTotalMD.Text = Val(TxtLast.Text) + Val(TxtMdfo3at.Text)

            Else
                Response.Redirect("Balances.aspx")
            End If

        End If
    End Sub

    Protected Sub Menu1_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        LblAccNme.Text = e.Item.Text
        LblAccNum.Text = e.Item.Value

        If CheckBox1.Checked Then
            SumClass1.Load_TWAB3_DATA(LblAccNum.Text)
            LblTwb3ID.Text = SumClass1.TWAB3_DATA_DT.Rows(0).Item("ACC_ID")
        End If
       
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        If Month(TxtDate.Text) <> Month(Now.Date) Or Year(TxtDate.Text) <> Year(Now.Date) Then
            MsgBox("لا يمكنك تسجيل حساب إلا في الشهر الحالي فقط")
            Exit Sub

        End If

        If CheckBox1.Checked Then
            If DGV2.Rows.Count < 1 Then

            Else
                Dim i As Integer = 0
                For Each rw As GridViewRow In DGV2.Rows
                    'MsgBox(DGV2.Rows(i).Cells(0).Text.ToString())
                    Dim val As [String] = DGV2.Rows(i).Cells(0).Text.ToString()
                    If val = LblAccNum.Text Then
                        MsgBox("هذا الحساب تم ادخاله من قبل")
                        Exit Sub
                    End If
                    i = i + 1
                Next
            End If


            If TxtDate.Text = Now.Date Then
                Insert_PART1(SumClass1.MaxTwab3ID() + 1, LblAccNum.Text, Val(TxtCount.Text), Val(TxtAmount.Text), Val(TxtSell.Text), Session("OFCE_ID"), Now)

                If Val(TxtSell.Text) > 0 Then
                    Dim S As Integer = 0
                    Dim A As Integer = 0

                    For Each rw As GridViewRow In DGV1.Rows
                        Dim vall As Integer = Val(DGV1.Rows(S).Cells(1).Text.ToString())
                        If vall = LblTwb3ID.Text Then
                            A = 1
                            Exit For
                        Else
                            A = 0
                        End If

                        S = S + 1
                    Next

                    If A = 1 Then
                        'Update
                        Update_ACC_D_FromTwab3(Val(TxtSell.Text) + Val(DGV1.Rows(S).Cells(5).Text.ToString), Val(DGV1.Rows(S).Cells(0).Text.ToString))
                    Else
                        Insert_ACC_D(SumClass1.MaxID() + 1, Session("OFCE_ID"), LblTwb3ID.Text, 0, Val(TxtSell.Text), Now)
                    End If

                    'If DGV1.Rows.Count < 1 Then
                    '    Insert_ACC_D(MaxID() + 1, Session("OFCE_ID"), LblTwb3ID.Text, 0, Val(TxtSell.Text), Now)
                    'End If

                End If

            Else
                Insert_PART1(SumClass1.MaxTwab3ID() + 1, LblAccNum.Text, Val(TxtCount.Text), Val(TxtAmount.Text), Val(TxtSell.Text), Session("OFCE_ID"), TxtDate.Text)

                If Val(TxtSell.Text) > 0 Then
                    Insert_ACC_D(SumClass1.MaxID() + 1, Session("OFCE_ID"), LblTwb3ID.Text, 0, Val(TxtSell.Text), TxtDate.Text)
                End If

                MsgBox("تم تعديل البيانات بنجاح")
            End If


            CLR()
        End If

        If TxtCount.Text = "" Or TxtAmount.Text = "" Or LblAccNme.Text = "" Then

            ClientScript.RegisterClientScriptBlock(Me.GetType, "ExceptionMessage", "<script type='text/JavaScript'>alert('!يجب اختيار نوع الحساب اولا');</script>")
        Else
            SumClass1.S_date = TxtDate.Text

            Try
                If DGV1.Rows.Count < 1 Then
                Else
                    Dim i As Integer = 0
                    For Each rw As GridViewRow In DGV1.Rows
                        Dim val As [String] = DGV1.Rows(i).Cells(1).Text.ToString()
                        If val = LblAccNum.Text Then
                            MsgBox("هذا الحساب تم ادخاله من قبل")
                            Exit Sub
                        End If
                        i = i + 1
                    Next
                End If

                If TxtDate.Text = Now.Date Then
                    Insert_ACC_D(SumClass1.MaxID() + 1, Session("OFCE_ID"), LblAccNum.Text, TxtCount.Text, Val(TxtAmount.Text), Now)
                Else
                    Insert_ACC_D(SumClass1.MaxID() + 1, Session("OFCE_ID"), LblAccNum.Text, TxtCount.Text, TxtAmount.Text, TxtDate.Text)
                    MsgBox("تم تعديل البيانات بنجاح")
                End If

                SumClass1.S_date = TxtDate.Text

            Catch ex As Exception
                If (ex.Message.Contains("Unique")) Then
                    ClientScript.RegisterClientScriptBlock(Me.GetType, "ExceptionMessage", "<script type='text/JavaScript'>alert(' Unique key violation');</script>")
                Else
                    ClientScript.RegisterClientScriptBlock(Me.GetType, "ExceptionMessage", "<script type='text/JavaScript'>alert('هذا الحساب تم ادخاله من قبل خطأ غير معروف;</script>")
                End If
            End Try
            CLR()
        End If

    End Sub

    Protected Sub CLR()
        TxtCount.Text = ""
        TxtAmount.Text = ""
        LblAccNme.Text = ""
        LblAccNum.Text = ""

        TxtCount.Focus()
        DGV1.DataBind()
        DGV2.DataBind()
        Response.Redirect(Request.Url.AbsoluteUri)
    End Sub

    Protected Sub TxtDate_TextChanged(sender As Object, e As System.EventArgs) Handles TxtDate.TextChanged
        'Dim TxDate As String = TxtDate.Text.Substring(3, 2) + "/" + TxtDate.Text.Substring(0, 2) + "/" + TxtDate.Text.Substring(6, 4)

        SumClass1.Load_DailyData(TxtDate.Text, Session("OFCE_ID"))
        DGV1.DataBind()
    End Sub

    Protected Sub DGV1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles DGV1.PageIndexChanging
        DGV1.PageIndex = e.NewPageIndex
        SumClass1.Load_DailyData(TxtDate.Text, Session("OFCE_ID"))
        DGV1.DataBind()
    End Sub

    Protected Sub DGV1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DGV1.SelectedIndexChanged
        MsgBox(DGV1.SelectedIndex)
    End Sub

    Public Sub Delete_ACC_D(ByVal ID2 As Integer)
        Dim CMD As New SqlCommand("Delete from ACC_D Where ID= @ID2", SumClass1.Conn)
        CMD.Parameters.Add("ID2", SqlDbType.Int).Value = ID2
        If SumClass1.Conn.State = ConnectionState.Open Then SumClass1.Conn.Close()
        SumClass1.Conn.Open()
        CMD.ExecuteNonQuery()
        SumClass1.Conn.Close()
        CMD = Nothing
    End Sub

    Public Sub Update_ACC_D(ByVal CCOUNT As Integer, ByVal AMOUNT As Single, ByVal ID2 As Integer)
        Dim CMD As New SqlCommand("Update ACC_D Set CCOUNT =@CCOUNT, AMOUNT =@AMOUNT Where ID= @ID2", SumClass1.Conn)
        With CMD.Parameters
            .Add("CCOUNT", SqlDbType.Int).Value = CCOUNT
            .Add("AMOUNT", SqlDbType.Decimal).Value = AMOUNT
            .Add("ID2", SqlDbType.Int).Value = ID2
        End With
        If SumClass1.Conn.State = ConnectionState.Open Then SumClass1.Conn.Close()
        SumClass1.Conn.Open()
        CMD.ExecuteNonQuery()
        SumClass1.Conn.Close()
        CMD = Nothing
    End Sub

  

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged

        Dim valuePath As String = "stamp"
        Dim item As MenuItem = Menu1.FindItem(valuePath)

        If CheckBox1.Checked = True Then
            If Not item Is Nothing Then
                item.Enabled = True
                TxtSell.Visible = True
                Label13.Visible = True
                Label4.Text = "الوارد"
                Label5.Text = "المرتد"
                DGV2.Visible = True
                LblAccNum.Text = ""
                LblAccNme.Text = ""
            End If
        Else
            TxtSell.Visible = False
            Label13.Visible = False
            item.Enabled = False
            Label4.Text = "العدد"
            Label5.Text = "المبلغ"
            DGV2.Visible = True
            LblAccNum.Text = ""
            LblAccNme.Text = ""
        End If
    End Sub

    Protected Sub DGV1_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles DGV1.RowEditing
        DGV1.EditIndex = e.NewEditIndex
        DataBind()

    End Sub


    Protected Sub OnRowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow AndAlso DGV1.EditIndex <> e.Row.RowIndex Then
            TryCast(e.Row.Cells(7).Controls(1), LinkButton).Attributes("onclick") = "return confirm('Do you want to delete this row?');"
            'e.Row.Cells(5).Text = "Catcher"
        End If
    End Sub
    


    Protected Sub Button2_Click1(sender As Object, e As System.EventArgs) Handles Button2.Click
        MsgBox(Month(TxtDate.Text))
        MsgBox(Year(TxtDate.Text))

    End Sub

    Protected Sub BtnModfy_Click(sender As Object, e As System.EventArgs) Handles BtnModfy.Click
        Dim TxDate As Date
        TxDate = Date.Parse(TxtDate.Text)
        SumClass1.Load_DailyData(TxDate, Session("OFCE_ID"))
        DGV1.DataBind()
        TxtErad.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 2)
        TxtMakbodat.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 3)
        TxtMdfo3at.Text = SumClass1.SumAmount2(TxtDate.Text, Session("ofce_id"), 4)
        SumClass1.SumAmountFrst1(Session("ofce_id"))


        TxtFrst.Text = SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("FRSTMONY") + (SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 2) + SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 3)) - SumClass1.SumAmountFrst(TxtDate.Text, Session("ofce_id"), 4)

        TxtTotalMK.Text = Val(TxtErad.Text) + Val(TxtMakbodat.Text) + Val(TxtFrst.Text)
        TxtLast.Text = (Val(TxtErad.Text) + Val(TxtMakbodat.Text) + Val(TxtFrst.Text)) - Val(TxtMdfo3at.Text)
        TxtTotalMD.Text = Val(TxtLast.Text) + Val(TxtMdfo3at.Text)

        EDT = "True"

        If Month(TxtDate.Text) <> Month(Now.Date) Or Year(TxtDate.Text) <> Year(Now.Date) Then


            DGV1.Columns(7).Visible = False
            DGV1.Columns(8).Visible = False
        Else
            DGV1.Columns(7).Visible = True
            DGV1.Columns(8).Visible = True

        End If

    End Sub
End Class

