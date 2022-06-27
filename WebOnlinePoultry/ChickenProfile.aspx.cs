using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebOnlinePoultry
{
    public partial class Database : System.Web.UI.Page
    {
        SqlConnection cpc = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            cpc.Open();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = cpc.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "INSERT INTO ChickenProfile VALUES('"+CType.SelectedValue+"', '"+CBirthD.Text+"', '"+CBirthW.Text+"', '"+CBreed.SelectedValue+"', '"+ProductType.SelectedValue+"')";

            int k = cmd.ExecuteNonQuery();
            if(k != 0)
            {
                dbUpdater.Text = "New data inserted to Database.";
                dbUpdater.ForeColor = System.Drawing.Color.Aquamarine;
                CType.SelectedIndex = -1;
                CBirthD.Text = "";
                CBirthW.Text = "";
                CBreed.SelectedIndex = -1;
                ProductType.SelectedIndex = -1;
                GridView1.DataBind();
            }
            cpc.Close();
            textUpdate();
        }
        public void textUpdate()
        {
            dbUpdater.Text = "Database Updated.";
            dbUpdater.ForeColor = System.Drawing.Color.BlueViolet;
        }
    }
}