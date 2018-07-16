<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/mpOutside.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:Panel ID="pnlLogin" runat="server" GroupingText="Login Area" DefaultButton="btnLogin" Height="220px">
        <table width="30%" style="height: 203px">
            <tr>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
    &nbsp;
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    &nbsp;TN<br />
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Please Enter a UserName" SetFocusOnError="True" ValidationGroup="Login"></asp:RequiredFieldValidator>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                &nbsp;1<br />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Please Enter a Password" SetFocusOnError="True" ValidationGroup="Login"></asp:RequiredFieldValidator>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" ValidationGroup="Login" CssClass="loginbutton" Height="37px" Width="83px" />
                    <asp:SqlDataSource ID="dsLogin" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" SelectCommand="SELECT [pkUserID], [vcUserName], [vcPassword] FROM [tblNguyenUser] WHERE ([vcUserName] = @vcUserName)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtUserName" Name="vcUserName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

