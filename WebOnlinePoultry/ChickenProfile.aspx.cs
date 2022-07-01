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
            try
            {
                cpc.Open();
            }
            catch (Exception)
            {
                throw;
            }
            if (!IsPostBack)
            {
                dbUpdater.Text = "Connected!";
                dbUpdater.ForeColor = System.Drawing.Color.Green;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("poultryInsert", cpc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@iCType", CType.SelectedValue);
            cmd.Parameters.AddWithValue("@iCBirthD", CBirthD.Text);
            cmd.Parameters.AddWithValue("@iCBirthW", float.Parse(CBirthW.Text));
            cmd.Parameters.AddWithValue("@iCBreed", CBreed.SelectedValue);
            cmd.Parameters.AddWithValue("@iPType", ProductType.SelectedValue);

            int k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                textWarning.Text = "New data added!";
                textWarning.Font.Bold = true;
                textWarning.ForeColor = System.Drawing.Color.GreenYellow;
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
            SqlCommand cmd = new SqlCommand("poultrySave", cpc);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@sCType", mcdType.SelectedValue);
            cmd.Parameters.AddWithValue("@sCBirthD", mcdBirthD.Text);
            cmd.Parameters.AddWithValue("@sCBirthW", float.Parse(mcdBirthW.Text));
            cmd.Parameters.AddWithValue("@sCBreed", mcdBreed.SelectedValue);
            cmd.Parameters.AddWithValue("@sPType", mcdProductType.SelectedValue);

            if (cpc.State == ConnectionState.Open)
            {
                cpc.Close();
            }
            textWarning.Text = "";
            cpc.Open();

            double k = cmd.ExecuteNonQuery();
            if (k != 0)
            {
                mcdNotif.Attributes["class"] = mcdNotif.Attributes["class"].Replace("alert-warning", "alert-success").Trim();
                mcdTitle.InnerText = "Data Updated!";
                mcdText.InnerText = "Data has been modified and save. To see the current updated database look in the top database table.";
                mcdType.SelectedIndex = -1;
                mcdBirthD.Text = "DD/MM/YYYY";
                mcdBirthW.Text = "0";
                mcdBreed.SelectedIndex = -1;
                mcdProductType.SelectedIndex = -1;
                GridView1.DataBind();
                mcdGridOut.DataSource = "";
                mcdGridOut.DataBind();
            }
            cpc.Close(); 
        }

        protected void mcdClear_Click(object sender, EventArgs e)
        {
            mcdNotif.Attributes["class"] = mcdNotif.Attributes["class"].Replace("alert-warning", "alert-info").Trim();
            mcdTitle.InnerText = "Cleared!";
            mcdText.InnerText = "Manage Chicken Database textboxes and radio buttons data's is cleared.";
            mcdType.SelectedIndex = -1;
            mcdBirthD.Text = "DD/MM/YYYY";
            mcdBirthW.Text = "0";
            mcdBreed.SelectedIndex = -1;
            mcdProductType.SelectedIndex = -1;
        }

        protected void mcdDelte_Click(object sender, EventArgs e)
        {

        }

        int differencial;

        protected void srcBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            string showtext = srcBy.SelectedItem.Text + " - " + srcBy.SelectedItem.Value;

            switch (srcBy.SelectedItem.Value)
            {
                case "srcID":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (!srcBox.Visible && srcRadio.Visible)
                        {
                            srcBox.Visible = true;
                            srcBox.Disabled = false;
                            srcButton.Enabled = true;
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                        else
                        {
                            srcBox.Visible = true;
                            srcBox.Disabled = false;
                            srcButton.Enabled = true;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (!srcBox.Visible && srcRadio.Visible)
                        {
                            srcBox.Visible = true;
                            srcBox.Disabled = false;
                            srcButton.Enabled = true;
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                        else
                        {
                            srcBox.Visible = true;
                            srcBox.Disabled = false;
                            srcButton.Enabled = true;
                        }
                    }
                    srcBoxValidator.Enabled = true;
                    srcBoxRange.Enabled = true;
                    srcRadioValidator.Enabled = false;
                    srcBox.Attributes.Add("type", "number");
                    srcBox.Attributes.Add("placeholder", "ID");
                    differencial = 1;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;

                case "srcTYPE":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                            srcRadio.Visible = true;
                        }
                        else
                        {
                            srcRadio.Visible = true;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                            srcRadio.Visible = true;
                        }
                        else
                        {
                            srcRadio.Visible = true;
                        }
                    }
                    srcRadio.Items.Clear();
                    srcRadio.Items.Add("LAYER");
                    srcRadio.Items[0].Value = "Layer";
                    srcRadio.Items.Add("BROILER");
                    srcRadio.Items[1].Value = "Broiler";
                    srcButton.Enabled = true;
                    srcRadio.CssClass = "form-control-custom radio-custom";
                    srcBoxValidator.Enabled = false;
                    srcBoxRange.Enabled = false;
                    srcRadioValidator.Enabled = true;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;

                case "srcBIRTHD":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (srcRadio.Visible && !srcBox.Visible)
                        {
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (srcRadio.Visible && !srcBox.Visible)
                        {
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                    }
                    srcBox.Visible = true;
                    srcBox.Disabled = false;
                    srcButton.Enabled = true;
                    srcBox.Attributes.Add("type", "date");
                    srcBoxValidator.Enabled = true;
                    srcBoxRange.Enabled = false;
                    srcRadioValidator.Enabled = false;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;

                case "srcBIRTHW":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (!srcBox.Visible && srcRadio.Visible)
                        {
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (!srcBox.Visible && srcRadio.Visible)
                        {
                            srcRadio.Items.Clear();
                            srcRadio.Visible = false;
                        }
                    }
                    srcBox.Visible = true;
                    srcBox.Disabled = false;
                    srcButton.Enabled = true;
                    srcBoxValidator.Enabled = true;
                    srcBoxRange.Enabled = true;
                    srcRadioValidator.Enabled = false;
                    srcBox.Attributes.Add("type", "number");
                    srcBox.Attributes.Add("placeholder", "WEIGHT");
                    differencial = 2;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;

                case "srcBREED":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                        }
                    }
                    srcRadio.Visible = true;
                    srcButton.Enabled = true;
                    srcRadio.Items.Clear();
                    srcRadio.Items.Add("ROOSTER");
                    srcRadio.Items[0].Value = "Rooster";
                    srcRadio.Items.Add("HEN");
                    srcRadio.Items[1].Value = "Hen";
                    srcRadio.CssClass = "form-control-custom radio-custom";
                    srcBoxValidator.Enabled = false;
                    srcBoxRange.Enabled = false;
                    srcRadioValidator.Enabled = true;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;

                case "srcPTYPE":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                        }
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        if (!srcRadio.Visible && srcBox.Visible)
                        {
                            srcBox.Disabled = true;
                            srcBox.Visible = false;
                        }
                    }
                    srcButton.Enabled = true;
                    srcRadio.Visible = true;
                    srcRadio.Items.Clear();
                    srcRadio.Items.Add("45 DAYS");
                    srcRadio.Items[0].Value = "45 Days";
                    srcRadio.Items.Add("EGG");
                    srcRadio.Items[1].Value = "EGG";
                    srcRadio.CssClass = "form-control-custom radio-custom";
                    srcBoxValidator.Enabled = false;
                    srcBoxRange.Enabled = false;
                    srcRadioValidator.Enabled = true;
                    mcdReqType.Enabled = true;
                    mcdReqBirth.Enabled = true;
                    mcdReqWeight.Enabled = true;
                    mcdReqBreed.Enabled = true;
                    mcdReqPType.Enabled = true;
                    break;
                default:
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcMDiv.Attributes.Add("class", "form-group");
                    }
                    srcBox.Value = "(None)";
                    srcBox.Attributes.Add("placeholder", "(None)");
                    srcBox.Attributes.Add("disabled", "disabled");
                    srcBox.Visible = true;
                    srcRadio.Visible = false;
                    srcButton.Enabled = false;
                    mcdReqType.Enabled = false;
                    mcdReqBirth.Enabled = false;
                    mcdReqWeight.Enabled = false;
                    mcdReqBreed.Enabled = false;
                    mcdReqPType.Enabled = false;
                    break;
            }
        }

        protected void srcButton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("poultrySearch", cpc)
            {
                CommandType = CommandType.StoredProcedure
            };

            if (srcRadio.Enabled && srcBox.Disabled)
            {
                switch (srcRadio.SelectedValue.ToString())
                {
                    case "Layer":
                        cmd.Parameters.AddWithValue("@CType", srcRadio.SelectedValue.ToString());
                        break;

                    case "Broiler":
                        cmd.Parameters.AddWithValue("@CType", srcRadio.SelectedValue.ToString());
                        break;

                    case "Rooster":
                        cmd.Parameters.AddWithValue("@CBreed", srcRadio.SelectedValue.ToString());
                        break;

                    case "Hen":
                        cmd.Parameters.AddWithValue("@CBreed", srcRadio.SelectedValue.ToString());
                        break;

                    case "45 Days":
                        cmd.Parameters.AddWithValue("@CPType", srcRadio.SelectedValue.ToString());
                        break;

                    case "EGG":
                        cmd.Parameters.AddWithValue("@CPType", srcRadio.SelectedValue.ToString());
                        break;

                    default:
                        testout.InnerText = "Opss somethings wrong";
                        break;
                }
            }
            else if (srcBox.Type.Equals("number") && differencial == 1)
            {
                cmd.Parameters.AddWithValue("@Cid", int.Parse(srcBox.Value));
            }
            else if (srcBox.Type.Equals("number") && differencial == 2)
            {
                cmd.Parameters.AddWithValue("@CWeight", float.Parse(srcBox.Value));
            }
            else if (srcBox.Type.Equals("date"))
            {
                cmd.Parameters.AddWithValue("@CBirth", srcRadio.SelectedValue.ToString());
            }
            mcdGridOut.DataSource = cmd.ExecuteNonQuery();
            mcdGridOut.DataBind();
            cpc.Close();
        }

        protected void CType_SelectedIndexChanged(object sender, EventArgs e)
        {
            mcdReqType.Enabled = false;
            mcdReqBirth.Enabled = false;
            mcdReqWeight.Enabled = false;
            mcdReqBreed.Enabled = false;
            mcdReqPType.Enabled = false;
        }
    }
}