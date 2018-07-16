using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ManageLoans : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grvSchedule_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void dsCurrentLoan_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        dsCustomerLoan.DataBind();
        grvCustomerLoanList.DataBind();
    }
    protected void dsCurrentLoan_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        dsCustomerLoan.DataBind();
        grvCustomerLoanList.DataBind();
    }
    protected void dsCurrentLoan_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        dsCustomerLoan.DataBind();
        grvCustomerLoanList.DataBind();
    }
    protected void grvCustomerLoanList_SelectedIndexChanged(object sender, EventArgs e)
    {
        decimal decPrin = decimal.Parse(grvCustomerLoanList .SelectedRow .Cells[3].Text.ToString());
        decimal decInterestRate = decimal.Parse(grvCustomerLoanList.SelectedRow.Cells[4].Text.ToString());
        int intMonth = int.Parse(grvCustomerLoanList.SelectedRow.Cells[5].Text.ToString());

        Loan2018.PaymentCalculator loanpay = new Loan2018.PaymentCalculator();
        loanpay.Principal = decPrin;
        loanpay.InterestRate = decInterestRate;
        loanpay.Months = intMonth;

        lblPayment.Text = loanpay.MonthlyPayment.ToString("C");

        grvSchedule.DataSource = loanpay.Schedule;
        grvSchedule.DataBind();
    }
    protected void decInterestRateTextBox_TextChanged(object sender, EventArgs e)
    {

    }
}