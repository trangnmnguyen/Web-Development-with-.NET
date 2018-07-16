using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SlotMachineSundrup01302018
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        bool myblnFlash1 = false;
        bool myblnFlash2 = false;
        bool myblnFlash3 = false;



        int myCash = 500;
        int myCurrentBet = 100;

        private void ShowScreen()
        {
            // This will show the screen with the current bet and current cash.
            lblCashRemaining.Text = myCash.ToString("C");
            lblCurrentBet.Text = myCurrentBet.ToString("C");

            if (myCash < 600)
            {
                btnBet600.Visible = false;
            }
            else
            { btnBet600.Visible = true; }

            if (myCash <= 0)
            {
                MessageBox.Show("You have lost all your money, but I will give you some money back.", "Loser!", MessageBoxButtons.OKCancel);
                ResetTheScreen();
            }



        }



        void ResetTheScreen()
        {
            myCurrentBet = 100;
            myCash = 500;
            ShowScreen();
        }



        private void Form1_Load(object sender, EventArgs e)
        {
            ShowScreen();
        }

        private void tmrWindow1_Tick(object sender, EventArgs e)
        
        { RunTimer(lblWindowCounter1, pbxSlotWindow1); 
        if(RandomStop())
            {
                tmrWindow1.Enabled = false;
            }
        }

        private void tmrWindow2_Tick(object sender, EventArgs e)
        {
            RunTimer(lblWindowCounter2, pbxSlotWindow2);
            if (tmrWindow1.Enabled == false) // after tmrWindow1 stop, we stop randomstop for the 2nd.
            {
                if (RandomStop())
                {
                    tmrWindow2.Enabled = false;
                }
            }
        }

        private void tmrWindow3_Tick(object sender, EventArgs e)
        {
            RunTimer(lblWindowCounter3, pbxSlotWindow3);
            if (tmrWindow2.Enabled == false) // after tmrWindow2 stop, we stop randomstop for the third.
            {
                if (RandomStop())
                {
                    tmrWindow3.Enabled = false; // this is when timerwindow 3 stops.
                    CheckIfWeWon();
                }
            }
        }

        void CheckIfWeWon()
        {
            //This function will check if the user has won by mataching up the labels above the pictures.
            myblnFlash1 = false;
            myblnFlash2 = false;
            myblnFlash3 = false;


            if (lblWindowCounter1.Text == lblWindowCounter2.Text &&
                lblWindowCounter2.Text == lblWindowCounter3.Text)
            {
                myblnFlash1 = true;
                myblnFlash2 = true;
                myblnFlash3 = true;
                
                FlashBackgrounds();
                myCash += myCurrentBet * 10;


            }

            else if (lblWindowCounter1.Text == lblWindowCounter2.Text)
            {
                myblnFlash1 = true;
                myblnFlash2 = true;
             
                FlashBackgrounds();
                myCash += myCurrentBet;
            
            }

            // work needed!! 2&3, 1&3 

            ShowScreen();
        }
            
 void FlashBackgrounds()
 {
     // this will flash windows to tell the user that they have won!!!!!!!!
     tmrFlash.Enabled = true;
 
 }


        
        

        private void RunTimer(Label lbl, PictureBox pbx)
        {
            int intCounter = int.Parse(lbl.Text); //1.
            intCounter += 1; // intCounter = intCounter +1
            if (intCounter > 2)// 
            {
                intCounter = 1;
            }

            lbl.Text = intCounter.ToString();//2.

            PictureBox picShow = (PictureBox)Controls.Find("picRotate" + intCounter.ToString(), true)[0];

            pbx.BackgroundImage = picShow.BackgroundImage;//3.

        }

        private bool RandomStop() // This is to create a RandomStop method.
        {
            Random rnd = new Random();
            int intRandom = rnd.Next(20);
            if (intRandom == 8)
            {
                return true;
            }

            return false;
        }

        private void picRotate1_Click(object sender, EventArgs e)
        {

        }

        

        private void btnPull_Click(object sender, EventArgs e)
        {
            myCash -= myCurrentBet;// myCash= myCash-myCurrentBet
            tmrWindow1.Enabled = true;
            tmrWindow2.Enabled = true;
            tmrWindow3.Enabled = true;
        }

        private void tmrFlash_Tick(object sender, EventArgs e)
        {
            Color clrNextColor = picFlash1.BackColor;
            if (clrNextColor == Color.Red)
            {
                clrNextColor = Color.Blue;
            }
            else if (clrNextColor == Color.Blue)
            {
                clrNextColor = Color.Purple;
            }

            else { clrNextColor = Color.Red; }

            picFlash1.BackColor  = clrNextColor;
            picFlash2.BackColor = clrNextColor;
            picFlash3.BackColor = clrNextColor;

            picFlash1.Visible = myblnFlash1;
            picFlash2.Visible = myblnFlash2;
            picFlash3.Visible = myblnFlash3;



            if (RandomStop())

            { tmrFlash.Enabled = false; }// if random stop happens, we stop tmrFlash.. 

        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            ResetTheScreen();
        }

        private void btnBet100_Click(object sender, EventArgs e)
        {
            myCurrentBet = 100;
            ShowScreen();
        }

        private void btnBet600_Click(object sender, EventArgs e)
        {
            myCurrentBet = 600;
            ShowScreen();
        }

        private void btnBetMax_Click(object sender, EventArgs e)
        {
            myCurrentBet = myCash;
            ShowScreen();
        }

        private void pbxSlotWindow2_Click(object sender, EventArgs e)
        {

        }

    


       
    }
}
