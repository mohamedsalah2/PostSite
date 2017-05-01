Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class SumClass
    'Inherits System.Web.UI.Page

    Public constr As String = (ConfigurationManager.ConnectionStrings("PostKhazina").ToString)
    Public Conn As New SqlConnection(constr)
    Public DailyData_DT As New DataTable
    Public PART1_DT As New DataTable
    Public TWAB3_DATA_DT As New DataTable
    Public OFFCE_BALNCE_DT As New DataTable
    Public S_date As Date = Now.Date


    'نقدية أول المدة من جدول أرصدة المكتب
    Public Sub SumAmountFrst1(ByVal OFCE_ID As Integer)
        OFFCE_BALNCE_DT.Clear()
        Dim CMD As New SqlCommand("Select ID,OFCE_ID,GOV,RASID,STAMPS,CARDS,ESTMARAT,FRSTMONY,ATM From OFFCE_BALNCE where OFCE_ID=@OFCE_ID", Conn)
        CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        OFFCE_BALNCE_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub


    'دالة لإرجاع إجمالي الإيراد اليومي أو المقبوضات أو المدفوعات علي حسب الكاتيجوري
    Public Function SumAmountFrst(ByVal DDATE As Date, ByVal OFCE_ID As Integer, ByVal CATEGORY As Integer) As Double
        Dim NUMBER As Double
        Try
            Dim CMD As New SqlCommand("SELECT sum(AMOUNT) FROM DailyData WHERE DDate < @DDATE AND OFCE_ID=@OFCE_ID AND CATEGORY=@CATEGORY", Conn)
            CMD.Parameters.Add("DDATE", SqlDbType.Date).Value = DDATE
            CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
            CMD.Parameters.Add("CATEGORY", SqlDbType.Int).Value = CATEGORY
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function



    'لحساب إجمالي الإيراد اليومي أو المقبوضات أو المدفوعات لتاريخ معين حسب الكاتيجوري
    Public Function SumAmount2(ByVal DDATE As Date, ByVal OFCE_ID As Integer, ByVal CATEGORY As Integer) As Double
        Dim NUMBER As Double
        Try
            Dim CMD As New SqlCommand("SELECT sum(AMOUNT) FROM DailyData WHERE CONVERT(VARCHAR(12),DDate,103)=@DDATE AND OFCE_ID=@OFCE_ID AND CATEGORY=@CATEGORY", Conn)
            CMD.Parameters.Add("DDATE", SqlDbType.Date).Value = DDATE
            CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
            CMD.Parameters.Add("CATEGORY", SqlDbType.Int).Value = CATEGORY
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function


    '1لتحميل بيانات الحسابات اليومية في الداتا جريد
    Public Sub Load_DailyData(ByVal DDATE As Date, ByVal OFCE_ID As Integer)
        DailyData_DT.Clear()
        Dim CMD As New SqlCommand("Select ID,OFCE_ID,CCOUNT,AMOUNT,DDATE From DailyData WHERE (CONVERT(VARCHAR(12), DDATE, 103) = DDATE) AND OFCE_ID=@OFCE_ID", Conn)
        CMD.Parameters.Add("DDATE", SqlDbType.DateTime2).Value = DDATE
        CMD.Parameters.Add("OFCE_ID", SqlDbType.Int).Value = OFCE_ID
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        DailyData_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub


    'لتحميل بيانات الطوابع في الداتا جريد2
    Public Sub Load_TWAB3_DATA(ByVal AccID As Integer)
        TWAB3_DATA_DT.Clear()
        Dim CMD As New SqlCommand("Select * From TWAB3_DATA Where ID=@AccID", Conn)
        CMD.Parameters.Add("AccID", SqlDbType.Int).Value = AccID
        If Conn.State = ConnectionState.Open Then Conn.Close()
        Conn.Open()
        TWAB3_DATA_DT.Load(CMD.ExecuteReader)
        Conn.Close()
        CMD = Nothing
    End Sub


    Public Function MaxID() As Integer
        Dim NUMBER As Integer
        Try
            Dim CMD As New SqlCommand("SELECT MAX (ID) FROM ACC_D", Conn)
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function

    Public Function MaxTwab3ID() As Integer
        Dim NUMBER As Integer
        Try
            Dim CMD As New SqlCommand("SELECT MAX (ID) FROM PART1", Conn)
            Conn.Open()
            NUMBER = CMD.ExecuteScalar
            Conn.Close()
        Catch
            NUMBER = 0
            Conn.Close()
        End Try
        Return NUMBER
    End Function

    

End Class
