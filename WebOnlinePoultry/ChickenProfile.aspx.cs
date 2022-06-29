using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace WebOnlinePoultry
{
    public partial class Database : System.Web.UI.Page
    {
        SqlConnection cpc = new SqlConnection(ConfigurationManager.ConnectionStrings["ChickenProfileDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string warn = "Accidentally clicked this will lead to permanent data lost.";
            mcdDelte.ToolTip = warn;

            if(cpc.State == ConnectionState.Open)
            {
                cpc.Close();
            }
            textWarning.Text = "";
            cpc.Open();
            if (!IsPostBack)
            {
                dbUpdater.Text = "Connected!";
                dbUpdater.ForeColor = System.Drawing.Color.Green;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO ChickenProfile VALUES('" + CType.SelectedValue + "', '" + CBirthD.Text + "', '" + float.Parse(CBirthW.Text) + "', '" + CBreed.SelectedValue + "', '" + ProductType.SelectedValue + "')", cpc);

            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                textWarning.Text = "New data added!";
                textWarning.ForeColor = System.Drawing.Color.Green;
                CType.SelectedIndex = -1;
                CBirthD.Text = "";
                CBirthW.Text = "";
                CBreed.SelectedIndex = -1;
                ProductType.SelectedIndex = -1;
                GridView1.DataBind();
            }
            cpc.Close();
        }

        protected void mcdSave_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE ChickenProfile SET chickenType ='" + CType.SelectedValue + "', chickenBirthday = '" + CBirthD.Text + "', chickenBirthWeight = '" + float.Parse(CBirthW.Text) + "', chickenBreed = '" + CBreed.SelectedValue + "', productType = '" + ProductType.SelectedValue + "'", cpc);

            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {

            }
            cpc.Close(); 
        }

        protected void mcdClear_Click(object sender, EventArgs e)
        {

        }

        protected void mcdDelte_Click(object sender, EventArgs e)
        {

        }

        protected void CBirthW_TextChanged(object sender, EventArgs e)
        {
            if (CBirthW.Text.Length >= 2)
            {
                int acceptednumber = Convert.ToInt32(CBirthW.Text);
                if (acceptednumber < 0 || CBirthW.Text.StartsWith("-"))
                {
                    CBirthW.Text = "0";
                }
                else
                {
                    CBirthW.Text = CBirthW.Text;
                }
            }
        }

        protected void srcBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}