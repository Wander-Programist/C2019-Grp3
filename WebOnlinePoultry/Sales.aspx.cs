using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebOnlinePoultry
{
    public partial class Sales : System.Web.UI.Page
    {
        SqlConnection cpc = new SqlConnection(ConfigurationManager.ConnectionStrings["someeDB"].ConnectionString);

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
                ddlPType.SelectedIndex = 0;
                ddlSPType.Items.Clear();
                ddlVolumeType.Items.Clear();
                TBVolume.Text = "";
                GridView1.DataBind();
                ddlSearchType.SelectedIndex = 0;
            }
        }

        protected void ddlPType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlPType.SelectedValue)
            {
                case "Egg":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
                        ddlVolumeType.Items.Clear();
                        labelSubName.Text = "Nan";
                        labelVolumeType.Text = "Nan";
                        labelVolume.Text = "Nan";
                        ddlSPType.Items.Clear();
                        ddlSPType.Enabled = false;
                        ddlVolumeType.Items.Clear();
                        ddlVolumeType.Enabled = false;
                        TBVolume.Text = "";
                        TBVolume.Enabled = false;
                        btnAddSale.Enabled = false;

                    }
                    ddlVolumeType.Items.Clear();
                    ddlVolumeType.Enabled = true;
                    labelVolumeType.Text = "Tray Type:";
                    ddlVolumeType.Items.Insert(0, new ListItem("None", ""));
                    ddlVolumeType.Items.Insert(1, new ListItem("Dozen", "Dozen"));
                    ddlVolumeType.Items.Insert(2, new ListItem("Half", "Half"));
                    ddlVolumeType.Items.Insert(3, new ListItem("Full", "Full"));
                    ddlVolumeType.SelectedIndex = 0;
                    SubIdentifier.Value = "EggSizes";
                    QuerySaver.Value = "SELECT EggSizes FROM EggSizesAvailable";
                    ddlSPType.Enabled = true;
                    labelSubName.Text = "Egg Size:";
                    labelSubName.Visible = true;
                    ddlSearchType.SelectedIndex = 0;
                    break;

                case "Whole":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
                        ddlVolumeType.Items.Clear();
                        labelSubName.Text = "Nan";
                        labelVolumeType.Text = "Nan";
                        labelVolume.Text = "Nan";
                        ddlSPType.SelectedIndex = -1;
                        ddlSPType.Enabled = false;
                        ddlVolumeType.SelectedIndex = -1;
                        ddlVolumeType.Enabled = false;
                        TBVolume.Text = "";
                        TBVolume.Enabled = false;
                        btnAddSale.Enabled = false;
                        ddlVolumeType.Items.Clear();
                    }
                    ddlVolumeType.Items.Clear();
                    labelSubName.Text = "Chicken Type:";
                    labelVolumeType.Text = "Nan:";
                    labelVolume.Text = "Kilo:";
                    TBVolume.Enabled = true;
                    RangeValidator1.Enabled = true;
                    RequiredFieldValidator1.Enabled = true;
                    volType.Value = "4";
                    ddlSPType.Enabled = true;
                    btnAddSale.Enabled = true;
                    SubIdentifier.Value = "WholeType";
                    QuerySaver.Value = "SELECT WholeType FROM WholeChickenAvailable";
                    ddlSearchType.SelectedIndex = 0;
                    break;

                case "Parts":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
                        ddlVolumeType.Items.Clear();
                        labelSubName.Text = "Nan";
                        labelVolumeType.Text = "Nan";
                        labelVolume.Text = "Nan";
                        ddlSPType.SelectedIndex = -1;
                        ddlSPType.Enabled = false;
                        ddlVolumeType.SelectedIndex = -1;
                        ddlVolumeType.Enabled = false;
                        TBVolume.Text = "";
                        TBVolume.Enabled = false;
                        btnAddSale.Enabled = false;
                        ddlVolumeType.Items.Clear();
                    }
                    ddlVolumeType.Items.Clear();
                    btnAddSale.Enabled = true;
                    labelVolume.Text = "Kilo:";
                    labelVolumeType.Text = "Nan:";
                    TBVolume.Enabled = true;
                    RangeValidator1.Enabled = true;
                    RequiredFieldValidator1.Enabled = true;
                    SubIdentifier.Value = "ChickenParts";
                    QuerySaver.Value = "SELECT ChickenParts FROM ChickenPartsAvailable";
                    volType.Value = "4";
                    ddlSPType.Enabled = true;
                    labelSubName.Text = "Part Type:";
                    ddlSearchType.SelectedIndex = 0;
                    break;

                default:
                    ddlSPType.Items.Clear();
                    ddlSPType.SelectedIndex = -1;
                    ddlSPType.Enabled = false;
                    ddlVolumeType.Items.Clear();
                    ddlVolumeType.SelectedIndex = -1;
                    ddlVolumeType.Enabled = false;
                    labelSubName.Text = "Nan:";
                    labelVolumeType.Text = "Nan:";
                    labelVolume.Text = "Nan:";
                    TBVolume.Text = "";
                    TBVolume.Enabled = false;
                    RangeValidator1.Enabled = false;
                    RequiredFieldValidator1.Enabled = false;
                    btnAddSale.Enabled = false;
                    volType.Value = "";
                    SubIdentifier.Value = "";
                    break;
            }
            if (SubIdentifier.Value != "" && QuerySaver.Value != "")
            {
                SqlCommand cmd = new SqlCommand(QuerySaver.Value.ToString(), cpc);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable DT = new DataTable();

                sda.Fill(DT);
                ddlSPType.DataSource = DT;
                ddlSPType.DataTextField = SubIdentifier.Value;
                ddlSPType.DataValueField = ddlSPType.DataTextField;
                ddlSPType.DataBind();
                cpc.Close();
                SubIdentifier.Value = null;
                QuerySaver.Value = null;
            }
        }

        protected void ddlVolumeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
            {
                if (ddlVolumeType.SelectedIndex > 0)
                {
                    TBVolume.Enabled = true;
                    RangeValidator1.Enabled = true;
                    RequiredFieldValidator1.Enabled = true;
                    labelVolume.Text = "Quantity:";
                    btnAddSale.Enabled = true;
                }
                else
                {
                    labelVolume.Text = "";
                    TBVolume.Text = "";
                    TBVolume.Enabled = false;
                    RangeValidator1.Enabled = false;
                    RequiredFieldValidator1.Enabled = false;
                    btnAddSale.Enabled = false;
                }
            }
        }

        protected void btnAddSale_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("NewSalesInsert", cpc);
            cmd.CommandType = CommandType.StoredProcedure;

            if (ddlPType.SelectedIndex > 0)
            {
                if (ddlPType.SelectedValue == "Egg")
                {
                    cmd.Parameters.AddWithValue("@ProType", ddlPType.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@SubIdentifier", ddlSPType.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@volIdentity", Convert.ToInt32(ddlVolumeType.SelectedIndex));
                    cmd.Parameters.AddWithValue("@Quantity", TBVolume.Text);
                }
                else if (ddlPType.SelectedValue == "Whole" || ddlPType.SelectedValue == "Parts" && !ddlVolumeType.Enabled)
                {
                    cmd.Parameters.AddWithValue("@ProType", ddlPType.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@SubIdentifier", ddlSPType.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@volIdentity", 4);
                    cmd.Parameters.AddWithValue("@Quantity", TBVolume.Text);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Opss Something's happend!')", true);
                }

                int check = cmd.ExecuteNonQuery();
                if (check != 0)
                {
                    ddlPType.SelectedIndex = 0;
                    ddlSPType.Items.Clear();
                    ddlVolumeType.Items.Clear();
                    TBVolume.Text = "";
                    ddlSPType.Enabled = false;
                    ddlVolumeType.Enabled = false;
                    TBVolume.Enabled = false;
                    btnAddSale.Enabled = false;
                    RequiredFieldValidator1.Enabled = false;
                    GridView1.DataBind();

                }
                cpc.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('New data added!')", true);
            }
        }

        protected void ddlSearchType_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (ddlSearchType.SelectedIndex)
            {
                //TB
                case 1:
                    if (ddlSearchIdent.Enabled && ddlSearchIdent.Items.Count >= 0 || ddlSearchIdent.SelectedIndex >= 0)
                    {
                        ddlSearchIdent.Items.Clear();
                        ddlSearchIdent.Enabled = false;
                        ddlSearchIdent.Visible = false;
                    }
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = false;
                    RangeSearch.Enabled = true;
                    RequiredSearch.Enabled = true;
                    TBSearchIdent.Attributes.Add("type", "number");
                    btnSearch.Enabled = true;
                    ddlPType.SelectedIndex = 0;
                    break;

                //DDL
                case 2:
                    if (btnSearch.Enabled && !TBSearchIdent.Disabled || TBSearchIdent.Value != "")
                    {
                        TBSearchIdent.Value = "";
                        TBSearchIdent.Disabled = true;
                        TBSearchIdent.Visible = false;
                        btnSearch.Enabled = false;
                    }
                    ddlSearchIdent.Items.Clear();
                    ddlSearchIdent.Enabled = true;
                    ddlSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = true;
                    TBSearchIdent.Visible = false;
                    RangeSearch.Enabled = false;
                    RequiredSearch.Enabled = false;
                    ddlPType.SelectedIndex = 0;
                    SQuery.Value = "productType";
                    break;

                //DDL
                case 3:
                    if (btnSearch.Enabled && !TBSearchIdent.Disabled || TBSearchIdent.Value != "")
                    {
                        TBSearchIdent.Value = "";
                        TBSearchIdent.Disabled = true;
                        TBSearchIdent.Visible = false;
                        btnSearch.Enabled = false;
                    }
                    ddlSearchIdent.Items.Clear();
                    ddlSearchIdent.Enabled = true;
                    ddlSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = true;
                    TBSearchIdent.Visible = false;
                    RangeSearch.Enabled = false;
                    RequiredSearch.Enabled = false;
                    ddlPType.SelectedIndex = 0;
                    SQuery.Value = "categoryName";
                    break;

                //DDL
                case 4:
                    if (btnSearch.Enabled && !TBSearchIdent.Disabled || TBSearchIdent.Value != "")
                    {
                        TBSearchIdent.Value = "";
                        TBSearchIdent.Disabled = true;
                        TBSearchIdent.Visible = false;
                        btnSearch.Enabled = false;
                    }
                    ddlSearchIdent.Items.Clear();
                    ddlSearchIdent.Enabled = true;
                    ddlSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = true;
                    TBSearchIdent.Visible = false;
                    RangeSearch.Enabled = false;
                    RequiredSearch.Enabled = false;
                    ddlPType.SelectedIndex = 0;
                    SQuery.Value = "volumeType";
                    break;

                //TB
                case 5:
                    if (ddlSearchIdent.Enabled && ddlSearchIdent.Items.Count >= 0 || ddlSearchIdent.SelectedIndex >= 0)
                    {
                        ddlSearchIdent.Items.Clear();
                        ddlSearchIdent.Enabled = false;
                        ddlSearchIdent.Visible = false;
                    }
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = false;
                    TBSearchIdent.Attributes.Add("type", "number");
                    RangeSearch.Enabled = true;
                    RequiredSearch.Enabled = true;
                    btnSearch.Enabled = true;
                    ddlPType.SelectedIndex = 0;
                    break;

                //TB(Date)
                case 6:
                    if (ddlSearchIdent.Enabled && ddlSearchIdent.Items.Count >= 0 || ddlSearchIdent.SelectedIndex >= 0)
                    {
                        ddlSearchIdent.Items.Clear();
                        ddlSearchIdent.Enabled = false;
                        ddlSearchIdent.Visible = false;
                    }
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = false;
                    TBSearchIdent.Attributes.Add("type", "date");
                    RangeSearch.Enabled = false;
                    RequiredSearch.Enabled = true;
                    btnSearch.Enabled = true;
                    ddlPType.SelectedIndex = 0;
                    break;

                //TB
                case 7:
                    if (ddlSearchIdent.Enabled && ddlSearchIdent.Items.Count >= 0 || ddlSearchIdent.SelectedIndex >= 0)
                    {
                        ddlSearchIdent.Items.Clear();
                        ddlSearchIdent.Enabled = false;
                        ddlSearchIdent.Visible = false;
                    }
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = false;
                    TBSearchIdent.Attributes.Add("type", "number");
                    RangeSearch.Enabled = true;
                    RequiredSearch.Enabled = true;
                    btnSearch.Enabled = true;
                    ddlPType.SelectedIndex = 0;
                    break;

                //TB
                case 8:
                    if (ddlSearchIdent.Enabled && ddlSearchIdent.Items.Count >= 0 || ddlSearchIdent.SelectedIndex >= 0)
                    {
                        ddlSearchIdent.Items.Clear();
                        ddlSearchIdent.Enabled = false;
                        ddlSearchIdent.Visible = false;
                    }
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = false;
                    RangeSearch.Enabled = true;
                    RequiredSearch.Enabled = true;
                    TBSearchIdent.Attributes.Add("type", "number");
                    btnSearch.Enabled = true;
                    ddlPType.SelectedIndex = 0;
                    break;

                default:
                    btnSearch.Enabled = false;
                    ddlSearchIdent.Items.Clear();
                    ddlSearchIdent.Enabled = false;
                    ddlSearchIdent.Visible = false;
                    TBSearchIdent.Value = "";
                    TBSearchIdent.Visible = true;
                    TBSearchIdent.Disabled = true;
                    TBSearchIdent.Attributes.Add("type", "number");
                    RangeSearch.Enabled = false;
                    RequiredSearch.Enabled = false;
                    break;
            }
            //HQuery.Value = ddlPType.SelectedIndex.ToString();
            if (ddlSearchType.SelectedIndex == 2 || ddlSearchType.SelectedIndex == 3 || ddlSearchType.SelectedIndex == 4)
            {
                SqlDataAdapter sda = new SqlDataAdapter("ddlSearchDistinct", cpc);
                sda.SelectCommand.CommandType = CommandType.StoredProcedure;
                sda.SelectCommand.Parameters.AddWithValue("@check", ddlSearchType.SelectedValue.ToString());

                DataTable DT = new DataTable();
                sda.Fill(DT);
                ddlSearchIdent.DataSource = DT;
                ddlSearchIdent.DataValueField = ddlSearchType.SelectedValue.ToString();
                ddlSearchIdent.DataTextField = ddlSearchType.SelectedValue.ToString();
                ddlSearchIdent.DataBind();
                btnSearch.Enabled = true;
                cpc.Close();
            }
            else
            {
                testOut.Text = "Error: " + SQuery.Value.ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SaleSearchBy", cpc);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@headerName", ddlSearchType.SelectedIndex);
            if (!TBSearchIdent.Disabled)
            {
                cmd.Parameters.AddWithValue("@searched", TBSearchIdent.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@searched", ddlSearchIdent.SelectedValue);
            }
            SalesSearch.DataSource = cmd.ExecuteReader();
            SalesSearch.DataBind();
            cpc.Close();
        }
    }
}