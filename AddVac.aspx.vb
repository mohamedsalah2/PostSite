Imports System.Data.SqlClient
Imports System.Data

Partial Class AddVac
    Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)
    Public Employee_DT As New DataTable

    Public Sub Load_Employee(ByVal EmpNo As Integer)
        Employee_DT.Clear()
        Dim CMD As New SqlCommand("Select * From Employee where EmpNo = @EmpNo", Conn)
        CMD.Parameters.Add("EmpNo", SqlDbType.Int).Value = EmpNo
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        Employee_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub


    Public Function MaxVctionID() As Integer
        Dim NUMBER As Integer
        Try
            Dim CMD As New SqlCommand("SELECT MAX (ID) FROM Vction", Conn)
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function

    Public Sub Insert_Vction(ByVal ID As Integer, ByVal EmpID As Integer, ByVal VacID As Integer, ByVal EZN As Integer, ByVal DDATE As Date, ByVal NOTES As String, ByVal VacCount As Integer)

        Dim CMD As New SqlCommand("Insert Into Vction(ID, EmpID, VacID, EZN, DDATE, NOTES, VacCount)Values(@ID, @EmpID, @VacID, @EZN, @DDATE, @NOTES, @VacCount)", Conn)

        With CMD.Parameters
            .Add("ID", SqlDbType.Int).Value = ID
            .Add("EmpID", SqlDbType.Int).Value = EmpID
            .Add("VacID", SqlDbType.Int).Value = VacID
            .Add("EZN", SqlDbType.Int).Value = EZN
            .Add("DDATE", SqlDbType.Date).Value = DDATE
            .Add("NOTES", SqlDbType.VarChar).Value = NOTES
            .Add("VacCount", SqlDbType.Int).Value = VacCount

        End With
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        CMD.ExecuteNonQuery()
        Conn.Close()
        CMD = Nothing
    End Sub


    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click

        LblEmpName.Text = ""
        Load_Employee(TxtEmpNo.Text)

        If Employee_DT.Rows.Count > 0 Then
            LblEmpName.Text = Employee_DT.Rows(0).Item("EmpName")
            LblEmpName.DataBind()
        Else
            MsgBox("رقم الملف غير صحيح")
        End If
        
    End Sub

    Private Sub CLR()
        TxtEmpNo.Text = ""
        TxtNotes.Text = ""
        TxtVacDate.Text = ""
        TxtVacDaysNo.Text = ""
        LblEmpName.Text = ""

    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As System.EventArgs) Handles LinkButton2.Click
        Insert_Vction(MaxVctionID() + 1, TxtEmpNo.Text, RadioButtonList1.SelectedValue, 0, TxtVacDate.Text, TxtNotes.Text, TxtVacDaysNo.Text)
        CLR()

    End Sub
End Class
