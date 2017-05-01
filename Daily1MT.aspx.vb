Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.Reporting.WebForms
Imports Microsoft.Reporting

Partial Class Daily1MT
    Inherits System.Web.UI.Page

    Public SumClass1 As New SumClass

    Public Sub Report1MT()
        Try
            RV_1MT.Visible = True

            Dim M As String = TxtDate.Text
            Dim rpDate As New ReportParameter("rpDate", M)
            Dim rpOffice As New ReportParameter("rpOffice", txtOffice.Text)
            Dim rpOfficeName As New ReportParameter("rpOfficeName", DropOfce1.SelectedItem.ToString)

            ' 1خزينة
            Select Case DropReport.SelectedValue
                Case 1

                    RV_1MT.Reset()
                    RV_1MT.LocalReport.ReportPath = "REPORTS\RPTDaily1MT.rdlc"
                    RV_1MT.LocalReport.DataSources.Clear()
                    Dim ds As New ReportDataSource("DataSet1", ObjectDataSource1)
                    ds.DataSourceId = "ObjectDataSource1"
                    RV_1MT.LocalReport.DataSources.Add(ds)
                    RV_1MT.DataBind()

                    Dim Frst, LastAmount, RPT_Blnce As Double
                    SumClass1.SumAmountFrst1(txtOffice.Text)
                    Frst = (SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("FRSTMONY") + SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 2) + SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 3)) - SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 4)
                    LastAmount = Frst + (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 2)) + (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 3)) - (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 4))
                    RPT_Blnce = SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("RASID")

                    Dim RpFirstAmount As New ReportParameter("Report_FirstAmount_Parameter", Frst)
                    Dim RpLastAmount As New ReportParameter("Report_LastAmount_Parameter", LastAmount)
                    Dim RpOfceBlnce As New ReportParameter("Report_OfceBalance_Parameter", RPT_Blnce)

                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOffice})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOfficeName})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpDate})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpFirstAmount})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpLastAmount})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpOfceBlnce})

                    RV_1MT.LocalReport.Refresh()

                    ' خزينة طوابع1
                Case 2
                    RV_1MT.Reset()
                    RV_1MT.LocalReport.DataSources.Clear()
                    Dim ds As New ReportDataSource("DataSet1", ObjectDataSource1)
                    ds.DataSourceId = "Twab3DataSource"
                    RV_1MT.LocalReport.DataSources.Add(ds)
                    RV_1MT.LocalReport.ReportPath = "REPORTS\RptDailyTwab3.rdlc"

                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOffice})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOfficeName})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpDate})
                    RV_1MT.LocalReport.Refresh()
                    '  جرد العهد والطوابع
                Case 3
                    RV_1MT.Reset()
                    RV_1MT.LocalReport.DataSources.Clear()
                    'Dim ds As New ReportDataSource("DataSourceName", ObjectDataSource1)
                    Dim ds As New ReportDataSource("DataSet1", ObjectDataSource1)
                    ds.DataSourceId = "Twab3DataSource"
                    RV_1MT.LocalReport.DataSources.Add(ds)
                    RV_1MT.LocalReport.ReportPath = "REPORTS\RptMnthTrans1.rdlc"

                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOffice})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOfficeName})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpDate})

                    RV_1MT.LocalReport.Refresh()
                    '  جرد العهد والطوابع
                Case 5
                    'DropReport.SelectedValue = 5
                    RV_1MT.Reset()
                    RV_1MT.LocalReport.DataSources.Clear()
                    Dim ds As New ReportDataSource("DataSet1", ObjectDataSource1)
                    RV_1MT.LocalReport.ReportEmbeddedResource = "REPORTS\RPTAllTwab3.rdlc"
                    ds.DataSourceId = "AllTwb3DataSource"
                    RV_1MT.LocalReport.DataSources.Add(ds)
                    RV_1MT.LocalReport.ReportPath = "REPORTS\RPTAllTwab3.rdlc"
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOffice})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOfficeName})
                    RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpDate})

                    RV_1MT.LocalReport.Refresh()
            End Select
        Catch ex As Exception
            ' MsgBox("لا يوجد بيانات للعرض" & vbCrLf & ex.Message)
            MsgBox("لا يوجد بيانات للعرض")

            RV_1MT.Visible = False

            'ex.Message()
            'ex.InnerException.Message()
            'ex.InnerException.InnerException.Message()
        End Try
    End Sub



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'txtOffice0.Text = DropOfce.SelectedItem.Text


            If Not Page.IsPostBack Then


                ' txtOffice1.Text = Integer.Parse(Session("ofce_id"))
                TxtDate.Text = Format(Now.Date, "dd/MM/yyyy")
                txtOffice.Text = Integer.Parse(Session("ofce_id"))


                DropZone.SelectedValue = 5
                DropZone.Enabled = False
                'DropOfce.SelectedValue = 2502
                DropOfce1.SelectedValue = Integer.Parse(Session("ofce_id"))

                Dim M As String = TxtDate.Text
                Dim rpDate As New ReportParameter("rpDate", M)
                Dim rpOffice As New ReportParameter("rpOffice", txtOffice.Text)

                RV_1MT.Reset()
                RV_1MT.LocalReport.ReportPath = "REPORTS\RPTDaily1MT.rdlc"
                RV_1MT.LocalReport.DataSources.Clear()
                Dim ds As New ReportDataSource("DataSet1", ObjectDataSource1)
                ds.DataSourceId = "ObjectDataSource1"
                RV_1MT.LocalReport.DataSources.Add(ds)
                RV_1MT.DataBind()
                'RV_1MT.LocalReport.Refresh()

                Dim Frst, LastAmount, RPT_Blnce As Double
                SumClass1.SumAmountFrst1(txtOffice.Text)
                Frst = (SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("FRSTMONY") + SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 2) + SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 3)) - SumClass1.SumAmountFrst(TxtDate.Text, txtOffice.Text, 4)
                LastAmount = Frst + (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 2)) + (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 3)) - (SumClass1.SumAmount2(TxtDate.Text, txtOffice.Text, 4))
                RPT_Blnce = SumClass1.OFFCE_BALNCE_DT.Rows(0).Item("RASID")

                Dim RpFirstAmount As New ReportParameter("Report_FirstAmount_Parameter", Frst)
                Dim RpLastAmount As New ReportParameter("Report_LastAmount_Parameter", LastAmount)
                Dim RpOfceBlnce As New ReportParameter("Report_OfceBalance_Parameter", RPT_Blnce)

                RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOffice})
                RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpDate})
                RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpFirstAmount})
                RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpLastAmount})
                RV_1MT.LocalReport.SetParameters(New ReportParameter() {RpOfceBlnce})


                Dim rpOfficeName As New ReportParameter("rpOfficeName", DropOfce1.SelectedItem.Text)
                RV_1MT.LocalReport.SetParameters(New ReportParameter() {rpOfficeName})

                RV_1MT.LocalReport.Refresh()

            End If

        Catch ex As Exception
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Report1MT()

    End Sub

    Protected Sub BtnMAIN_Click(sender As Object, e As System.EventArgs) Handles BtnMAIN.Click
        Response.Redirect("MAIN.aspx")
    End Sub


    Protected Sub DropOfce_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropOfce1.SelectedIndexChanged
        txtOffice.Text = DropOfce1.SelectedValue
        RV_1MT.Visible = False

    End Sub

   
    Protected Sub DropReport_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropReport.SelectedIndexChanged
        RV_1MT.Visible = False
    End Sub

   
End Class
