<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/mpSecure.master" AutoEventWireup="true" CodeFile="ManageCustomers.aspx.cs" Inherits="Pages_ManageCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">
    <p>Customers Information</br></p>
    <asp:GridView ID="grvCustomer" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="pkCustomerID" DataSourceID="dsCustomerList" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pkCustomerID" HeaderText="pkCustomerID" ReadOnly="True" SortExpression="pkCustomerID" Visible="False" />
            <asp:BoundField DataField="vcFirstName" HeaderText="FirstName" SortExpression="vcFirstName" />
            <asp:BoundField DataField="vcLastName" HeaderText="LastName" SortExpression="vcLastName" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" SelectCommand="SELECT [pkCustomerID], [vcFirstName], [vcLastName] FROM [tblNguyenCustomer]"></asp:SqlDataSource>
    <asp:FormView ID="frvCustomers" runat="server" DataSourceID="dsCustomerUpdate" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="pkCustomerID" GridLines="Horizontal">
        <EditItemTemplate>
            CustomerID:
            <asp:Label ID="pkCustomerIDLabel1" runat="server" Text='<%# Eval("pkCustomerID") %>' />
            <br />
            First Name:
            <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="vcFirstNameTextBox" Display="Dynamic" ErrorMessage="Please enter Customer's first name" SetFocusOnError="True" ValidationGroup="Customer"></asp:RequiredFieldValidator>
            <br />
            Last Name:
            <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="vcLastNameTextBox" Display="Dynamic" ErrorMessage="Please enter Customer's last name" SetFocusOnError="True" ValidationGroup="Customer"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Customer" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <InsertItemTemplate>
            First Name:
            <asp:TextBox ID="vcFirstNameTextBox" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="vcFirstNameTextBox" Display="Dynamic" ErrorMessage="Please enter Customer's first name" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
            <br />
            Last Name:
            <asp:TextBox ID="vcLastNameTextBox" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="vcLastNameTextBox" Display="Dynamic" ErrorMessage="Please enter Customer's last name" SetFocusOnError="True" ValidationGroup="Customers"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Customers" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            CustomerID:
            <asp:Label ID="pkCustomerIDLabel" runat="server" Text='<%# Eval("pkCustomerID") %>' />
            <br />
            First Name:
            <asp:Label ID="vcFirstNameLabel" runat="server" Text='<%# Bind("vcFirstName") %>' />
            <br />
            Last Name:
            <asp:Label ID="vcLastNameLabel" runat="server" Text='<%# Bind("vcLastName") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    </asp:FormView>
    <asp:SqlDataSource ID="dsCustomerUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" DeleteCommand="DELETE FROM [tblNguyenCustomer] WHERE [pkCustomerID] = @pkCustomerID" InsertCommand="INSERT INTO [tblNguyenCustomer] ([vcFirstName], [vcLastName]) VALUES (@vcFirstName, @vcLastName)" SelectCommand="SELECT [pkCustomerID], [vcFirstName], [vcLastName] FROM [tblNguyenCustomer] WHERE ([pkCustomerID] = @pkCustomerID)" UpdateCommand="UPDATE [tblNguyenCustomer] SET [vcFirstName] = @vcFirstName, [vcLastName] = @vcLastName WHERE [pkCustomerID] = @pkCustomerID" OnDeleted="dsCustomerUpdate_Deleted" OnInserted="dsCustomerUpdate_Inserted" OnSelected="dsCustomerUpdate_Selected">
        <DeleteParameters>
            <asp:Parameter Name="pkCustomerID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="vcFirstName" Type="String" />
            <asp:Parameter Name="vcLastName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grvCustomer" Name="pkCustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="vcFirstName" Type="String" />
            <asp:Parameter Name="vcLastName" Type="String" />
            <asp:Parameter Name="pkCustomerID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

