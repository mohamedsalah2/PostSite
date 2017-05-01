Imports System.Data.SqlClient
Imports System.Data


Partial Class OffceBlnce
    Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)
    Dim OfceData_DT As New DataTable


    Public Sub Load_OfceData(ByVal Zone As String, ByVal OfceName As String)
        OfceData_DT.Clear()
        Dim CMD As New SqlCommand("Select * From OFFICES WHERE zone=@zone AND OfficeName=@OfceName", Conn)
        CMD.Parameters.Add("Zone", SqlDbType.VarChar).Value = Zone
        CMD.Parameters.Add("OfceName", SqlDbType.VarChar).Value = OfceName
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        OfceData_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DropZone.SelectedValue = 5

            '       Load_OfceData(DropZone.SelectedValue, TxtOfceName.Text)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        'DgvOfce.DataBind()
        'Load_OfceData(DropZone.SelectedValue, TxtOfceName.Text)
    End Sub
End Class
