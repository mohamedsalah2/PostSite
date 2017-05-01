
Partial Class PostMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Menu1_MenuItemClick(sender As Object, e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        If e.Item.Value = "exit" Then

            Response.Redirect("login.aspx")

            Session.Clear()
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class

