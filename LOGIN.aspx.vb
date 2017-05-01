Imports System.Data.SqlClient
Imports System.Data

Partial Class LOGIN
    Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Me.TextBox1.Text = ""
        'Me.TextBox2.Text = ""
    End Sub


    'Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton11.Click
    '    Dim SQL As String = ("SELECT * FROM USERS WHERE UsrID like N'" & TextBox11.Text & "' AND PWD='" & TextBox22.Text & "' ")
    '    Dim DA As New SqlDataAdapter(SQL, Conn)
    '    Dim DT As New DataTable
    '    DA.Fill(DT)

    '    If DT.Rows.Count = 0 Then
    '        'MsgBox("حاول مرة أخري")

    '        LblErr1.Text = "خطأ في إسم المستخدم أو كلمة المرور"
    '        Me.TextBox11.Text = ""
    '        Me.TextBox22.Text = ""
    '        'ComboBox1.Text = ""

    '        Me.TextBox11.Focus()
    '        Exit Sub
    '    End If

    '    'USR = Me.TextBox1.Text
    '    'PRMSON = DT.Rows(0).Item("PRMISSON").ToString
    '    Session("UsrID") = DT.Rows(0).Item("UsrID").ToString
    '    Session("UsrName") = DT.Rows(0).Item("UsrName").ToString
    '    Session("PWD") = DT.Rows(0).Item("PWD").ToString
    '    Session("PRMTION") = DT.Rows(0).Item("PRMTION").ToString
    '    Session("OFCE_ID") = DT.Rows(0).Item("OFCE_ID").ToString
    '    Session("ID") = DT.Rows(0).Item("ID").ToString


    '    'Response.Redirect("Offices.aspx")
    '    Response.Redirect("MAIN.aspx")
    '    'Response.Redirect("DailyACCC.aspx")
    'End Sub

    Protected Sub LinkButton1_Click1(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Dim SQL As String = ("SELECT * FROM USERS WHERE UsrID like N'" & TextBox1.Text & "' AND PWD='" & TextBox2.Text & "' ")
        Dim DA As New SqlDataAdapter(SQL, Conn)
        Dim DT As New DataTable
        DA.Fill(DT)

        If DT.Rows.Count = 0 Then
            'MsgBox("حاول مرة أخري")

            LblErr.Text = "خطأ في إسم المستخدم أو كلمة المرور"
            Me.TextBox1.Text = ""
            Me.TextBox2.Text = ""
            'ComboBox1.Text = ""

            Me.TextBox1.Focus()
            Exit Sub
        End If

        'USR = Me.TextBox1.Text
        'PRMSON = DT.Rows(0).Item("PRMISSON").ToString
        Session("UsrID") = DT.Rows(0).Item("UsrID").ToString
        Session("UsrName") = DT.Rows(0).Item("UsrName").ToString
        Session("PWD") = DT.Rows(0).Item("PWD").ToString
        Session("PRMTION") = DT.Rows(0).Item("PRMTION").ToString
        Session("OFCE_ID") = DT.Rows(0).Item("OFCE_ID").ToString
        Session("ID") = DT.Rows(0).Item("ID").ToString


        'Response.Redirect("Offices.aspx")
        Response.Redirect("MAIN.aspx")
        'Response.Redirect("DailyACCC.aspx")
    End Sub
End Class
