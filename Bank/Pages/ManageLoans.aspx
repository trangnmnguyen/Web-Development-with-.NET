<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/mpSecure.master" AutoEventWireup="true" CodeFile="ManageLoans.aspx.cs" Inherits="Pages_ManageLoans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphMain" Runat="Server">
    <p>Loan Table </br></p>
    <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="dsCustomerList" DataTextField="vcLastName" DataValueField="pkCustomerID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" SelectCommand="SELECT [pkCustomerID], [vcFirstName], [vcLastName] FROM [tblNguyenCustomer]"></asp:SqlDataSource>
    <asp:Label ID="lblPayment" runat="server" Text="$0"></asp:Label>
    <asp:GridView ID="grvCustomerLoanList" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderWidth="1px" CellPadding="3" DataKeyNames="pkLoanID" DataSourceID="dsCustomerLoan" GridLines="Horizontal" OnSelectedIndexChanged="grvCustomerLoanList_SelectedIndexChanged" BorderStyle="None">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="pkLoanID" HeaderText="LoanID" InsertVisible="False" ReadOnly="True" SortExpression="pkLoanID" />
            <asp:BoundField DataField="fkCustomerID" HeaderText="CustomerID" SortExpression="fkCustomerID" />
            <asp:BoundField DataField="decPrincipal" HeaderText="Principal" SortExpression="decPrincipal" />
            <asp:BoundField DataField="decInterestRate" HeaderText="Interest Rate" SortExpression="decInterestRate" />
            <asp:BoundField DataField="intMonths" HeaderText="Months" SortExpression="intMonths" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" ForeColor="#F7F7F7" Font-Bold="True" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsCustomerLoan" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" SelectCommand="SELECT [pkLoanID], [fkCustomerID], [decPrincipal], [decInterestRate], [intMonths] FROM [tblNguyenLoan] WHERE ([fkCustomerID] = @fkCustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomer" Name="fkCustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="frvCustomerLoan" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="pkLoanID" DataSourceID="dsCurrentLoan" GridLines="Horizontal">
        <EditItemTemplate>
            LoanID:
            <asp:Label ID="pkLoanIDLabel1" runat="server" Text='<%# Eval("pkLoanID") %>' />
            <br />
            Interest Rate:
            <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' OnTextChanged="decInterestRateTextBox_TextChanged" /><br />
            <asp:RequiredFieldValidator ID="rfvInterestRate" runat="server" ControlToValidate="decInterestRateTextBox" Display="Dynamic" ErrorMessage="Please enter interest rate" SetFocusOnError="True" ValidationGroup="Loans"></asp:RequiredFieldValidator>
            <br />
            Principal:
            <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvPrincipal" runat="server" ControlToValidate="decPrincipalTextBox" Display="Dynamic" ErrorMessage="Please enter a principal" SetFocusOnError="True" ValidationGroup="Loans"></asp:RequiredFieldValidator>
            <br />
            Months:
            <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvMonths" runat="server" ControlToValidate="intMonthsTextBox" Display="Dynamic" ErrorMessage="Please enter months" SetFocusOnError="True" ValidationGroup="Loans"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Loans" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <EmptyDataTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </EmptyDataTemplate>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <InsertItemTemplate>
            Interest Rate:
            <asp:TextBox ID="decInterestRateTextBox" runat="server" Text='<%# Bind("decInterestRate") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvdecInterestRate" runat="server" ControlToValidate="decInterestRateTextBox" Display="Dynamic" ErrorMessage="Please enter interest rate" SetFocusOnError="True" ValidationGroup="CLoans"></asp:RequiredFieldValidator>
            <br />
            Principal:
            <asp:TextBox ID="decPrincipalTextBox" runat="server" Text='<%# Bind("decPrincipal") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvdecPrincipal" runat="server" ControlToValidate="decPrincipalTextBox" Display="Dynamic" ErrorMessage="Please enter a principal" SetFocusOnError="True" ValidationGroup="CLoans"></asp:RequiredFieldValidator>
            <br />
            Months:
            <asp:TextBox ID="intMonthsTextBox" runat="server" Text='<%# Bind("intMonths") %>' />
            <br />
            <asp:RequiredFieldValidator ID="rfvintMonths" runat="server" ControlToValidate="intMonthsTextBox" Display="Dynamic" ErrorMessage="Please enter months" ValidationGroup="CLoans"></asp:RequiredFieldValidator>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="CLoans" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            LoanID:
            <asp:Label ID="pkLoanIDLabel" runat="server" Text='<%# Eval("pkLoanID") %>' />
            &nbsp;<br /> Interest Rate:
            <asp:Label ID="decInterestRateLabel" runat="server" Text='<%# Bind("decInterestRate") %>' />
            <br />
            CustomerID:
            <asp:Label ID="fkCustomerIDLabel" runat="server" Text='<%# Bind("fkCustomerID") %>' />
            <br />
            Principal:
            <asp:Label ID="decPrincipalLabel" runat="server" Text='<%# Bind("decPrincipal") %>' />
            <br />
            Months:
            <asp:Label ID="intMonthsLabel" runat="server" Text='<%# Bind("intMonths") %>' />
            <br />

            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle ForeColor="#4A3C8C" HorizontalAlign="Right" BackColor="#E7E7FF" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    </asp:FormView>
    <asp:SqlDataSource ID="dsCurrentLoan" runat="server" ConnectionString="<%$ ConnectionStrings:2018Spring001ConnectionString %>" DeleteCommand="DELETE FROM [tblNguyenLoan] WHERE [pkLoanID] = @pkLoanID" InsertCommand="INSERT INTO [tblNguyenLoan] ([decInterestRate], [fkCustomerID], [decPrincipal], [intMonths]) VALUES (@decInterestRate, @fkCustomerID, @decPrincipal, @intMonths)" SelectCommand="SELECT [pkLoanID], [decInterestRate], [fkCustomerID], [decPrincipal], [intMonths] FROM [tblNguyenLoan] WHERE ([pkLoanID] = @pkLoanID)" UpdateCommand="UPDATE [tblNguyenLoan] SET [decInterestRate] = @decInterestRate, [fkCustomerID] = @fkCustomerID, [decPrincipal] = @decPrincipal, [intMonths] = @intMonths WHERE [pkLoanID] = @pkLoanID" OnDeleting="dsCurrentLoan_Deleting" OnInserted="dsCurrentLoan_Inserted" OnSelected="dsCurrentLoan_Selected">
        <DeleteParameters>
            <asp:Parameter Name="pkLoanID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="decInterestRate" Type="Decimal" />
            <asp:ControlParameter ControlID="ddlCustomer" Name="fkCustomerID" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="decPrincipal" Type="Decimal" />
            <asp:Parameter Name="intMonths" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grvCustomerLoanList" Name="pkLoanID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="decInterestRate" Type="Decimal" />
            <asp:Parameter Name="fkCustomerID" Type="Int32" />
            <asp:Parameter Name="decPrincipal" Type="Decimal" />
            <asp:Parameter Name="intMonths" Type="Int32" />
            <asp:Parameter Name="pkLoanID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="grvSchedule" runat="server" OnSelectedIndexChanged="grvSchedule_SelectedIndexChanged" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="EndingBalance" HeaderText="Ending Balance" DataFormatString="{0:c}"/>
            <asp:BoundField DataField="BeginingBalance" HeaderText="Begining Balance" DataFormatString="{0:c}"/>
            <asp:BoundField DataField="InterestPaid" HeaderText="Interest" DataFormatString="{0:c}"/>
            <asp:BoundField DataField="PrincipalPaid" HeaderText="Principal" DataFormatString="{0:c}"/>
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>
</asp:Content>

