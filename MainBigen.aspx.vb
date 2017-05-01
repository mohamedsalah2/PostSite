
Partial Class MainBigen
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(sender As Object, e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As System.EventArgs) Handles LinkButton2.Click
        Response.Redirect("EMP.aspx")
    End Sub
End Class
