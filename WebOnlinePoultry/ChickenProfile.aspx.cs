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
            if(!IsPostBack)
            {
                Calendar1.Visible = false;
            }
            cpc.Open();
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string type = CType.SelectedItem.Text, breed = CBreed.SelectedItem.Text, ptype = Convert.ToString(ProductType.SelectedItem.Text);
            string birthD = CBirthD.Text;
            decimal birthW = Convert.ToDecimal(CBirthW.Text);

            string query = "INSERT INTO dbo.AspNetChickenProfile VALUES('"+type+"', '"+birthD+"', '"+birthW+"', '"+breed+"'. '"+ptype+"')";
            SqlCommand cmd = new SqlCommand(query, cpc);

            cmd.Parameters.AddWithValue("@chickenType", type);
            cmd.Parameters.AddWithValue("@chickenBirthday", birthD);
            cmd.Parameters.AddWithValue("@chickenBirthWeight", birthW);
            cmd.Parameters.AddWithValue("@chickenBreed", breed);
            cmd.Parameters.AddWithValue("@productType", ptype);

            cmd.ExecuteNonQuery();
            cpc.Close();
            dbUpdater.Text = "New data inserted to Database.";
            GridView1.DataBind();
            CType.SelectedIndex = -1;
            CBirthD.Text = "";
            CBirthW.Text = "";
            CBreed.SelectedIndex = -1;
            ProductType.SelectedIndex = -1;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            Calendar1.Attributes.Add("style", "position:absolute");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            CBirthD.Text = Calendar1.SelectedDate.ToString("MM-dd-yyyy");
            Calendar1.Visible = false;
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.DimGray;
            }
        }
    }
}