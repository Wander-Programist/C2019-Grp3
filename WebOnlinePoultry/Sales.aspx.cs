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
    public partial class Sales : System.Web.UI.Page
    {
        SqlConnection cpc = new SqlConnection(ConfigurationManager.ConnectionStrings["ChickenProfileDB"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }

        protected void ddlPType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string identifier = null;
            switch (ddlPType.SelectedValue)
            {
                case "Egg":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
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
                        btnUpdate.Enabled = false;
                    }
                    SubIdentifier.Value = "EggSizes";
                    QuerySaver.Value = "SELECT EggSizes FROM EggSizesAvailable";
                    ddlSPType.Enabled = true;
                    labelSubName.Text = "Egg Size:";
                    labelSubName.Visible = true;
                    break;

                case "Whole":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
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
                        btnUpdate.Enabled = false;
                    }
                    SubIdentifier.Value = "WholeType";
                    QuerySaver.Value = "SELECT WholeType FROM WholeChickenAvailable";
                    ddlSPType.Enabled = true;
                    labelSubName.Text = "Chicken Type:";
                    break;

                case "Parts":
                    if (ddlSPType.Enabled && ddlSPType.Items.Count > 0 || ddlVolumeType.Enabled && ddlVolumeType.Items.Count > 0)
                    {
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
                        btnUpdate.Enabled = false;
                    }
                    SubIdentifier.Value = "ChickenParts";
                    QuerySaver.Value = "SELECT ChickenParts FROM ChickenPartsAvailable";
                    ddlSPType.Enabled = true;
                    labelSubName.Text = "Part Type:";
                    break;

                default:
                    ddlSPType.Items.Clear();
                    SubIdentifier.Value = "";
                    labelSubName.Text = "Nan:";
                    labelVolumeType.Text = "Nan:";
                    labelVolume.Text = "Nan:";
                    ddlSPType.SelectedIndex = -1;
                    ddlSPType.Enabled = false;
                    ddlVolumeType.SelectedIndex = -1;
                    ddlVolumeType.Enabled = false;
                    TBVolume.Text = "";
                    TBVolume.Enabled = false;
                    btnAddSale.Enabled = false;
                    btnUpdate.Enabled = false;
                    break;
            }
            if (SubIdentifier.Value != "" || QuerySaver.Value != "")
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
    }
}