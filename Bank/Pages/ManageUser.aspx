<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/mpSecure.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="Pages_ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">
    <p>User Information </br></p>
    <asp:FormView ID="frvUsers" runat="server" AllowPaging="True" DataKeyNames="pkUserID" DataSourceID="dsUsers" OnPageIndexChanging="frvUsers_PageIndexChanging" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
    <EditItemTemplate>
        UserID:
        <asp:Label ID="pkUserIDLabel1" runat="server" Text='<%# Eval("pkUserID") %>' />
        <br />
        User Name:
        <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Please enter user name" ControlToValidate="vcUserNameTextBox" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
        <br />
        First Name:
        <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="Please enter first name" ControlToValidate="vcFirstNameTextBox" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
        <br />
        Password:
        <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Please enter a password" ControlToValidate="vcPasswordTextBox" Display="Dynamic" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
        <br />
        Last Name:
        <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="vcLastNameTextBox" Display="Dynamic" ErrorMessage="Please enter last name" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="UpdateButton_Click" ValidationGroup="Customers" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
    <InsertItemTemplate>
        &nbsp;User Name:
        <asp:TextBox ID="vcUserNameTextBox" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="vcUserNameTextBox" Display="Dynamic" ErrorMessage="Please enter a username" SetFocusOnError="True" ValidationGroup="Users"></asp:RequiredFieldValidator>
        <br />
        First Name:
        <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="vcFirstNameTextBox" Display="Dynamic" ErrorMessage="Please enter your first name" SetFocusOnError="True" ValidationGroup="Users"></asp:RequiredFieldValidator>
        <br />
        Password:
        <asp:TextBox ID="vcPasswordTextBox" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="vcPasswordTextBox" Display="Dynamic" ErrorMessage="Please enter your password" SetFocusOnError="True" ValidationGroup="Users"></asp:RequiredFieldValidator>
        <br />
        Last Name:
        <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="vcLastNameTextBox" Display="Dynamic" ErrorMessage="Please enter your last name" SetFocusOnError="True" ValidationGroup="Users"></asp:RequiredFieldValidator>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Users" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        UserID:
        <asp:Label ID="pkUserIDLabel" runat="server" Text='<%# Eval("pkUserID") %>' />
        <br />
        User Name:
        <asp:Label ID="vcUserNameLabel" runat="server" Text='<%# Bind("vcUserName") %>' />
        <br />
        First Name:
        <asp:Label ID="vcFirstNameLabel" runat="server" Text='<%# Bind("vcFirstName") %>' />
        <br />
        Password:
        <asp:Label ID="vcPasswordLabel" runat="server" Text='<%# Bind("vcPassword") %>' />
        <br />
        Last Name:
        <asp:Label ID="vcLastNameLabel" runat="server" Text='<%# Bind("vcLastName") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
</asp:FormView>
<asp:SqlDataSource ID="dsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" DeleteCommand="DELETE FROM [tblNguyenUser] WHERE [pkUserID] = @pkUserID" InsertCommand="INSERT INTO [tblNguyenUser] ([vcUserName], [vcFirstName], [vcPassword], [vcLastName]) VALUES (@vcUserName, @vcFirstName, @vcPassword, @vcLastName)" SelectCommand="SELECT [pkUserID], [vcUserName], [vcFirstName], [vcPassword], [vcLastName] FROM [tblNguyenUser]" UpdateCommand="UPDATE [tblNguyenUser] SET [vcUserName] = @vcUserName, [vcFirstName] = @vcFirstName, [vcPassword] = @vcPassword, [vcLastName] = @vcLastName WHERE [pkUserID] = @pkUserID">
    <DeleteParameters>
        <asp:Parameter Name="pkUserID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="vcUserName" Type="String" />
        <asp:Parameter Name="vcFirstName" Type="String" />
        <asp:Parameter Name="vcPassword" Type="String" />
        <asp:Parameter Name="vcLastName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="vcUserName" Type="String" />
        <asp:Parameter Name="vcFirstName" Type="String" />
        <asp:Parameter Name="vcPassword" Type="String" />
        <asp:Parameter Name="vcLastName" Type="String" />
        <asp:Parameter Name="pkUserID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>

