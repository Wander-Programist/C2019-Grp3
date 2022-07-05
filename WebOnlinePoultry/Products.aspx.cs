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
    public partial class Products : System.Web.UI.Page
    {
        SqlConnection cpc = new SqlConnection(ConfigurationManager.ConnectionStrings["ChickenProfileDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (cpc.State == ConnectionState.Open)
            {
                cpc.Close();
            }
            try
            {
                cpc.Open();
            }
            catch (Exception)
            {
                Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
            if (!IsPostBack)
            {
                EggDB.DataBind();
                WholeChickenDB.DataBind();
                ChickenPartsDB.DataBind();
            }  
        }

        //Product Type Logic
        protected void ddlPType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string identifier = null, ValueField = null, TextField = null;
            switch (ddlPType.SelectedValue)
            {
                case "Egg":
                    if (ddlSType.Items.Count > 0)
                    {
                        ddlSType.Items.Clear();
                        identifier = "";
                        ValueField = "";
                        TextField = "";
                        ddlSType.Enabled = false;
                        TBKiloQuanty.Text = "";
                        TBKiloQuanty.Enabled = false;
                        RanKiloQuanty.Enabled = false;
                        ReqKiloQuanty.Enabled = false;
                        RegKiloQuanty.Enabled = false;
                        btnUpdate.Enabled = false;
                    }
                    identifier = "Select EggSizes, Quantity From EggSizesAvailable";
                    ValueField = "EggSizes";
                    TextField = ValueField;
                    ddlSType.Enabled = true;
                    labelQK.InnerText = "Quantities:";
                    break;

                case "Whole":
                    if (ddlSType.Items.Count > 0)
                    {
                        ddlSType.Items.Clear();
                        identifier = "";
                        ValueField = "";
                        TextField = "";
                        ddlSType.Enabled = false;
                        TBKiloQuanty.Text = "";
                        TBKiloQuanty.Enabled = false;
                        RanKiloQuanty.Enabled = false;
                        ReqKiloQuanty.Enabled = false;
                        RegKiloQuanty.Enabled = false;
                        btnUpdate.Enabled = false;
                    }
                    identifier = "Select WholeType, Quantity From WholeChickenAvailable";
                    ValueField = "WholeType";
                    TextField = ValueField;
                    ddlSType.Enabled = true;
                    labelQK.InnerText = "Quantities:";
                    break;

                case "Parts":
                    if (ddlSType.Items.Count > 0)
                    {
                        ddlSType.Items.Clear();
                        identifier = "";
                        ValueField = "";
                        TextField = "";
                        ddlSType.Enabled = false;
                        TBKiloQuanty.Text = "";
                        TBKiloQuanty.Enabled = false;
                        RanKiloQuanty.Enabled = false;
                        ReqKiloQuanty.Enabled = false;
                        RegKiloQuanty.Enabled = false;
                        btnUpdate.Enabled = false;
                    }
                    identifier = "Select ChickenParts, Kilos From ChickenPartsAvailable";
                    ValueField = "ChickenParts";
                    TextField = ValueField;
                    ddlSType.Enabled = true;
                    labelQK.InnerText = "Kilo:";
                    break;

                default:
                    identifier = null;
                    ValueField = null;
                    TextField = null;
                    ddlSType.Items.Clear();
                    ddlSType.Enabled = false;
                    btnUpdate.Enabled = false;
                    TBKiloQuanty.Text = "";
                    TBKiloQuanty.Enabled = false;
                    RanKiloQuanty.Enabled = false;
                    ReqKiloQuanty.Enabled = false;
                    RegKiloQuanty.Enabled = false;
                    ddlSType.SelectedIndex = -1;
                    labelQK.InnerText = "";
                    break;
            }
            if (identifier != null)
            {
                SqlDataAdapter sda = new SqlDataAdapter(identifier, cpc);
                DataTable dataTable = new DataTable();
                sda.Fill(dataTable);
                ddlSType.DataSource = dataTable;
                ddlSType.DataValueField = ValueField;
                ddlSType.DataTextField = TextField;
                ddlSType.DataBind();
            }
            identifier = null;
        }

        protected void ddlSType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = null;
            switch (ddlPType.SelectedValue)
            {
                case "Egg":
                    query = "SELECT * FROM EggSizesAvailable WHERE EggSizes = @QorK";
                    updateQuery.Value = "UPDATE EggSizesAvailable SET EggSizes = @CurName, Quantity = CAST(@NewVal AS INT), Date = CONVERT(DATE, CAST(GETDATE() AS DATE), 107) WHERE EggSizes = CAST(@Identifier AS NVARCHAR(20))";
                    break;
                case "Whole":
                    query = "SELECT * FROM WholeChickenAvailable WHERE WholeType =  @QorK";
                    updateQuery.Value = "UPDATE WholeChickenAvailable SET WholeType = @CurName, Quantity = CAST(@NewVal AS INT), Date = CONVERT(DATE, CAST(GETDATE() AS DATE), 107) WHERE WholeType = CAST(@Identifier AS NVARCHAR(20))";
                    break;
                case "Parts":
                    query = "SELECT * FROM ChickenPartsAvailable WHERE ChickenParts =  @QorK";
                    updateQuery.Value = "UPDATE ChickenPartsAvailable SET ChickenParts = @CurName, Kilos = CAST(@NewVal AS INT), Date = CONVERT(DATE, CAST(GETDATE() AS DATE), 107) WHERE ChickenParts = CAST(@Identifier AS NVARCHAR(20))";
                    break;
                default:
                    break;
            }
            if (ddlSType.SelectedIndex != -1 && query != null)
            {
                SqlCommand cmd = new SqlCommand(query, cpc);
                cmd.Parameters.AddWithValue("@QorK", ddlSType.SelectedValue.ToString());
                SqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    TBKiloQuanty.Text = da.GetValue(1).ToString();
                }
                TBKiloQuanty.Enabled = true;
                ReqKiloQuanty.Enabled = true;
                cpc.Close();
                query = null;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand(updateQuery.Value.ToString(), cpc);
            cmd.Parameters.AddWithValue("@Identifier", ddlSType.SelectedValue);
            cmd.Parameters.AddWithValue("@CurName", ddlSType.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@NewVal", TBKiloQuanty.Text);

            int check = cmd.ExecuteNonQuery();
            if (check != 0)
            {
                ddlPType.SelectedIndex = -1;
                ddlSType.Items.Clear();
                ddlSType.Enabled = false;
                btnUpdate.Enabled = false;
                TBKiloQuanty.Enabled = false;
                ReqKiloQuanty.Enabled = false;
                TBKiloQuanty.Text = "";
                cpc.Close();
                EggDB.DataBind();
                WholeChickenDB.DataBind();
                ChickenPartsDB.DataBind();
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data has been updated!')", true);
        }
    }
}