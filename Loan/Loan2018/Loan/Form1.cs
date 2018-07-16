using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Loan
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnCalculator_Click(object sender, EventArgs e)
        {

            Loan2018.PaymentCalculator clsLoan = new Loan2018.PaymentCalculator();
            clsLoan.Months = int.Parse(txtMonth.Text);
            clsLoan.Principal = decimal.Parse(txtPrincipal.Text);
            clsLoan.InterestRate = decimal.Parse(txtInterest.Text);
            lblPayment.Text = clsLoan.MonthlyPayment.ToString("C");

            dataGridView1.DataSource = clsLoan.Schedule;

        }
    }
}
