Imports System.Data.SqlClient
Imports System.Data

Partial Class Balances
    Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)

    Public OFFCE_BALNCE_DT As New DataTable
    Public OFFICES_DT As New DataTable


    Public Sub Load_OFFICES(ByVal OFCE_ID As Integer)
        OFFICES_DT.Clear()
        Dim CMD As New SqlCommand("Select OFCE_NAME From OFFICES where OFCE_ID=@OFCE_ID", Conn)
        CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        OFFICES_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub

    Public Sub Load_OFFCE_BALNCE(ByVal OFCE_ID As Integer)
        OFFCE_BALNCE_DT.Clear()
        Dim CMD As New SqlCommand("Select ID,OFCE_ID,GOV,RASID,STAMPS,CARDS,ESTMARAT,FRSTMONY,ATM From OFFCE_BALNCE where OFCE_ID=@OFCE_ID", Conn)
        CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        OFFCE_BALNCE_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub

    Public Function Max_OFFCE_BALNCE_ID() As Integer
        Dim NUMBER As Integer
        Try
            Dim CMD As New SqlCommand("SELECT MAX (ID) FROM OFFCE_BALNCE", Conn)
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function

    Public Sub Load_Data()

        Try
            If OFFCE_BALNCE_DT.Rows.Count > 0 Then
                TxtGov.Text = OFFCE_BALNCE_DT.Rows(0).Item("GOV")
                TxtRasid.Text = OFFCE_BALNCE_DT.Rows(0).Item("RASID")
                TxtStamps.Text = OFFCE_BALNCE_DT.Rows(0).Item("STAMPS")
                TxtCards.Text = OFFCE_BALNCE_DT.Rows(0).Item("CARDS")
                TxtEstmarat.Text = OFFCE_BALNCE_DT.Rows(0).Item("ESTMARAT")
                TxtFrstMony.Text = OFFCE_BALNCE_DT.Rows(0).Item("FRSTMONY")
                TxtAtm.Text = OFFCE_BALNCE_DT.Rows(0).Item("ATM")
            Else
                LblOfceID.Text = "يجب إدخال أرصدة المكتب أولاً"
            End If

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub


    Public Sub Insert_OFFCE_BALNCE(ByVal ID As Int32, ByVal OFCE_ID As Int32, ByVal GOV As Int32, ByVal RASID As Int32, ByVal STAMPS As Int32, ByVal CARDS As Int32, ByVal ESTMARAT As Int32, ByVal FRSTMONY As Decimal, ByVal ATM As Int32)

        Dim CMD As New SqlCommand("Insert Into OFFCE_BALNCE(ID, OFCE_ID, GOV, RASID, STAMPS, CARDS, ESTMARAT, FRSTMONY, ATM)Values(@ID, @OFCE_ID, @GOV, @RASID, @STAMPS, @CARDS, @ESTMARAT, @FRSTMONY, @ATM)", Conn)

        With CMD.Parameters
            .Add("ID", SqlDbType.Int).Value = ID
            .Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
            .Add("GOV", SqlDbType.Int).Value = GOV
            .Add("RASID", SqlDbType.Int).Value = RASID
            .Add("STAMPS", SqlDbType.Int).Value = STAMPS
            .Add("CARDS", SqlDbType.Int).Value = CARDS
            .Add("ESTMARAT", SqlDbType.Int).Value = ESTMARAT
            .Add("FRSTMONY", SqlDbType.Decimal).Value = FRSTMONY
            .Add("ATM", SqlDbType.Int).Value = ATM

        End With
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        CMD.ExecuteNonQuery()
        Conn.Close()
        CMD = Nothing
    End Sub

    Public Sub Update_OFFCE_BALNCE(ByVal GOV As Int32, ByVal RASID As Int32, ByVal STAMPS As Int32, ByVal CARDS As Int32, ByVal ESTMARAT As Int32, ByVal FRSTMONY As Decimal, ByVal ATM As Int32, ByVal OFCE_ID As Int32)

        Dim CMD As New SqlCommand("Update OFFCE_BALNCE Set GOV =@GOV, RASID =@RASID, STAMPS =@STAMPS, CARDS =@CARDS, ESTMARAT =@ESTMARAT, FRSTMONY =@FRSTMONY, ATM =@ATM Where OFCE_ID= @OFCE_ID", Conn)

        With CMD.Parameters
            .Add("GOV", SqlDbType.Int).Value = GOV
            .Add("RASID", SqlDbType.Int).Value = RASID
            .Add("STAMPS", SqlDbType.Int).Value = STAMPS
            .Add("CARDS", SqlDbType.Int).Value = CARDS
            .Add("ESTMARAT", SqlDbType.Int).Value = ESTMARAT
            .Add("FRSTMONY", SqlDbType.Decimal).Value = FRSTMONY
            .Add("ATM", SqlDbType.Int).Value = ATM
            .Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
        End With
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        CMD.ExecuteNonQuery()
        Conn.Close()
        CMD = Nothing
    End Sub


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'LblOfceID.Text = Session("OFCE_ID")
        If Not Page.IsPostBack Then
            Try
                Load_OFFCE_BALNCE(Session("OFCE_ID"))

                Load_OFFICES(Session("OFCE_ID"))
                LblOfceID.Text = OFFICES_DT.Rows(0).Item(0)
                Load_Data()
            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click

        Load_OFFCE_BALNCE(Session("OFCE_ID"))
        'MsgBox(OFFCE_BALNCE_DT.Rows.Count)

        If OFFCE_BALNCE_DT.Rows.Count > 0 Then
            Update_OFFCE_BALNCE(Val(TxtGov.Text), Val(TxtRasid.Text), Val(TxtStamps.Text), Val(TxtCards.Text), Val(TxtEstmarat.Text), Val(TxtFrstMony.Text), _
                                Val(TxtAtm.Text), Session("OFCE_ID"))
            MsgBox("تم التعديل بنجاح")
        Else
            Insert_OFFCE_BALNCE(Max_OFFCE_BALNCE_ID() + 1, Session("OFCE_ID"), Val(TxtGov.Text), Val(TxtRasid.Text), Val(TxtStamps.Text), Val(TxtCards.Text), _
                                Val(TxtEstmarat.Text), Val(TxtFrstMony.Text), Val(TxtAtm.Text))
            MsgBox("تم الحفظ بنجاح")
        End If

        Load_OFFCE_BALNCE(Session("OFCE_ID"))
        Load_Data()
        Response.Redirect("DailyAccc.aspx")

    End Sub
End Class
