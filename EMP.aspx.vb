Imports System.Data.SqlClient
Imports System.Data

Partial Class EMP
    Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)
    Public Employee_DT As New DataTable


    Public Sub Load_Employee()
        Employee_DT.Clear()
        Dim CMD As New SqlCommand("Select * From Employee", Conn)
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        Employee_DT.load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Load_Employee()

    End Sub
End Class
