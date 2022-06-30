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
                GridView2.DataSource = "";
                GridView2.DataBind();
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

        protected void srcBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            string showtext = srcBy.SelectedItem.Text + " - " + srcBy.SelectedItem.Value;
            switch (srcBy.SelectedItem.Value)
            {
                case "srcID":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "ID");
                        srcBox.Disabled = false;
                        srcBox.Attributes.Add("type", "number");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    if (srcBox.Type == "text")
                        //    {
                        //        func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //    }
                        //    else
                        //    {
                        //        func1.Text = "Failed!";
                        //    }
                        //    ////Response.Write(check(number));
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "ID");
                        srcBox.Disabled = false;
                        srcBox.Attributes.Add("type", "number");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes["type"].Replace("text", "number");
                        //    if (srcBox.Type == "text")
                        //    {
                        //        func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //    }
                        //    else
                        //    {
                        //        func1.Text = "Failed!";
                        //    }
                        //    //Response.Write(check(number));
                        //}
                    }
                    break;

                case "srcTYPE":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                            
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    if (srcBox.Type == "text")
                        //    {
                        //        func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //    }
                        //    else
                        //    {
                        //        func1.Text = "Failed!";
                        //    }
                        //    //Response.Write(check(search));
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    if (srcBox.Type == "text")
                        //    {
                        //        func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //    }
                        //    else
                        //    {
                        //        func1.Text = "Failed!";
                        //    }
                        //    //Response.Write(check(search));
                        //}
                    }
                    break;

                case "srcBIRTHD":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "date");
                        //    //Response.Write(check(date));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "date");
                        //    //Response.Write(check(date));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    break;

                case "srcBIRTHW":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Birth Weight");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "number");
                        //    //Response.Write(check(number));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Birth Weight");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "number");
                        //    //Response.Write(check(number));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    break;

                case "srcBREED":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Breed");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    //Response.Write(check(search));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Chicken Breed");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    //Response.Write(check(search));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    break;

                case "srcPTYPE":
                    if (srcMDiv.Attributes["class"].Contains("has-success"))
                    {
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Product Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    //Response.Write(check(search));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    else
                    {
                        srcMDiv.Attributes.Add("class", "has-success");
                        srcBox.Value = "";
                        srcBox.Attributes.Add("placeholder", "Product Type");
                        //if (srcBox.Disabled && !srcButton.Enabled)
                        //{
                        //    srcBox.Attributes.Remove("disabled");
                        //    srcButton.Enabled = true;
                        //    srcBox.Attributes.Add("class", "has-success");
                        //    srcBox.Attributes.Add("placeholder", "ID");
                        //    srcBox.Attributes.Remove("type");
                        //    srcBox.Attributes.Add("type", "search");
                        //    //Response.Write(check(search));
                        //    func1.Text = "switch " + srcBy.SelectedItem.Value + " Fired!";
                        //}
                    }
                    break;
                default:
                    srcBox.Attributes.Add("placeholder", "(None)");
                    srcBox.Attributes.Add("disabled", "disabled");
                    srcMDiv.Attributes["class"].Replace("has-success", "form-control");
                    break;
            }
        }

        private string check(string status)
        {
            string script = null;

            switch (status)
            {
                case "0":
                    script = "<script type-text/javascript> var srcBoxStatus = document.getElementById(' <%=srcBox.ClientID %> ').type; if('"+status+"' == 0){ srcBox.type = 'search'}</script>";
                    test1.Text = "Script 1 Fired";
                    break;
                case "1":
                    script = "<script type-text/javascript> var srcBoxStatus = document.getElementById(' <%=srcBox.ClientID %> ').type; if('" + status + "' == 1){ srcBox.type = 'number'}</script>";
                    test1.Text = "Script 2 Fired";
                    break;
                case "2":
                    script = "<script type-text/javascript> var srcBoxStatus = document.getElementById(' <%=srcBox.ClientID %> ').type; if('" + status + "' == 2){ srcBox.type = 'date'}</script>";
                    test1.Text = "Script 3 Fired";
                    break;
                default:
                    test1.Text = "Script 0 Fired";
                    break;
            }
            return status = script;
        }
    }
}