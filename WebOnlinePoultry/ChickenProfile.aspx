<%@ Page Title="Chicken Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChickenProfile.aspx.cs" Inherits="WebOnlinePoultry.Database" ViewStateEncryptionMode="Never" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-md-4">
                    <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Chick Profile Manager</h1>
                    <table class="table table-condensed">   
                        <tr>  
                            <td style="width: inherit;">Chicken Type:</td>  
                                <td style="width: 100%">
                                    <asp:RadioButtonList ID="CType" runat="server" RepeatDirection="Horizontal" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="CType_SelectedIndexChanged">
                                        <asp:ListItem>Layer</asp:ListItem>
                                        <asp:ListItem>Broiler</asp:ListItem>
                                        <asp:ListItem>Native</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chicken type cannot be empty." Text="*" ControlToValidate="CType" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </td>  
                        </tr>  
                        <tr>  
                            <td style="width: inherit;">
                                Chicken Birthday:
                            </td>  
                            <td aria-orientation="horizontal" style="width: 100%">  
                                <asp:TextBox ID="CBirthD" runat="server" Width="100%" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chicken birthday cannot be empty." Text="*" ControlToValidate="CBirthD" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>  
                        <tr>  
                            <td style="width: inherit;">
                                Chicken Birth Weight:
                            </td>  
                            <td style="width: 100%">  
                                <asp:TextBox ID="CBirthW" runat="server" Width="100%" TextMode="number" placeholder="0" CssClass="form-control" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chicken birth weight cannot be empty." Text="*" ControlToValidate="CBirthW" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Number should be greater than 0." ControlToValidate="CBirthW" Display="Dynamic" Type="Double" MinimumValue="0" MaximumValue="999"></asp:RangeValidator>
                            </td>  
                        </tr>  
                        <tr>  
                            <td style="width: inherit;">
                                Product Type:
                            </td>  
                            <td style="width: 100%">  
                                <asp:RadioButtonList ID="ProductType" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="radio, pull-left" required="required" >
                                    <asp:ListItem Value="45 Days">45 Days</asp:ListItem>
                                    <asp:ListItem Value="9 Days">9 Days</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Product type cannot be empty." Text="*" ControlToValidate="ProductType" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>  
                        </tr>  
                        <tr>  
                            <td colspan="2">  
                                <strong>  
                                <asp:Button ID="createChicProf" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="Button1_Click" style="font-weight: bold" Width="100%" ValidationGroup="AllValidators" />
                                </strong>
                            </td>
                        </tr>  
                    </table>
                </div>
        
                <div class="col-md-8" style="overflow:auto">
                    <h3 style="font-weight:bolder">Database Section</h3>
                    <h5 style="font-weight:bolder">Status:&nbsp;
                        <asp:Label ID="dbUpdater" runat="server" Text=""></asp:Label>
                    </h5>

                    <div style="width: 100%; height: 60vh; overflow-y:auto">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT Id, chickenType, FORMAT(CAST(chickenBirthday AS DATE), 'dd-MMM-yyyy') as date, chickenBirthWeight, productType FROM ChickenProfile"></asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" Font-Size="Large" Width="100%" AllowSorting="True" CssClass="table table-hover table-responsive" GridLines="Vertical" DataKeyNames="Id" DataSourceID="SqlDataSource1" >
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="chickenType" HeaderText="chickenType" SortExpression="chickenType" />
                                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ReadOnly="True" />
                                <asp:BoundField DataField="chickenBirthWeight" HeaderText="chickenBirthWeight" SortExpression="chickenBirthWeight" />
                                <asp:BoundField DataField="productType" HeaderText="productType" SortExpression="productType" />
                            </Columns>
                        <HeaderStyle CssClass="table-header" ForeColor="white"/>
                    </asp:GridView>
                    </div>
                </div>
            
                <div class="col-md-12">
                    <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Chicken Profile Database Manager</h1>
                        <div class="alert alert-dismissible alert-warning" id="mcdNotif" runat="server">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4 runat="server" id="mcdTitle" style="font-weight: bold">Warning!</h4>
                            <p runat="server" id="mcdText">Becareful in editing data here.<br />
                                Accidentally deleting a data will lead to permanent data lost of selected data and cannot be recovered by server.</p>
                        </div>
                        <div>
                            <table style="width:100%; vertical-align: middle; " class="table table-condensed table-responsive">
                                <tr>  
                                    <td style="text-align: right; ">Chicken Type:</td>  
                                    <td style="text-align: left; vertical-align: middle;">
                                        <asp:RadioButtonList ID="mcdType" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome" Font-Size="Medium" ToolTip="Types of Chicken" Height="100%" AutoPostBack="True">
                                            <asp:ListItem>Layer</asp:ListItem>
                                            <asp:ListItem>Broiler</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="mcdReqType" runat="server" ErrorMessage="Chicken birthday cannot be empty." Text="*" ControlToValidate="mcdType" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True" Enabled="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="3">
                                        <h1 style="text-align: center; vertical-align: middle; font-size: xx-large; font-weight: bolder; font-variant: small-caps; text-transform: uppercase; color: #FFFFFF; width: 100%;" class="form-control-custome label-info" style="font-weight:bolder; text-align:center; font-variant:small-caps; color: white; vertical-align: middle;">SEARCH BY</h1>
                                    </td>
                                </tr>  
                                <tr>  
                                    <td style="text-align: right; ">
                                        Chicken Birthday:
                                    </td>  
                                    <td style="text-align: left; vertical-align: middle;">  
                                        <asp:TextBox ID="mcdBirthD" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="True" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="mcdReqBirth" runat="server" ErrorMessage="Chicken birthday cannot be empty." Text="*" ControlToValidate="mcdBirthD" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True" Enabled="False"></asp:RequiredFieldValidator>
                                    </td>  
                                    <td colspan="3" style="text-align: left; vertical-align: middle">
                                        <asp:DropDownList ID="srcBy" runat="server" CssClass="form-control control-label" Font-Bold="true" AutoPostBack="True" OnSelectedIndexChanged="srcBy_SelectedIndexChanged" TabIndex="-1" >
                                            <asp:ListItem>(None)</asp:ListItem>
                                            <asp:ListItem Value="srcID">CHICKEN ID</asp:ListItem>
                                            <asp:ListItem Value="srcTYPE">CHICKEN TYPE</asp:ListItem>
                                            <asp:ListItem Value="srcBIRTHD">CHICKEN BIRTHDAY</asp:ListItem>
                                            <asp:ListItem Value="srcBIRTHW">CHICKEN BIRTH WEIGHT</asp:ListItem>
                                            <asp:ListItem Value="srcPTYPE">PRODUCT TYPE</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>  
                                <tr>  
                                    <td style="text-align: right; ">
                                        Chicken Birth Weight:
                                    </td>  
                                    <td style="text-align: left; vertical-align: middle;">  
                                        <asp:TextBox ID="mcdBirthW" runat="server" CssClass="form-control" max-width="auto" AutoPostBack="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="mcdReqWeight" runat="server" ErrorMessage="Chicken birth weight cannot be empty." Text="*" ControlToValidate="mcdBirthW" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True" Enabled="False"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="mcdRanWeight" runat="server" ErrorMessage="Number should be greater than 0." ControlToValidate="mcdBirthW" Display="Dynamic" Type="Double" MinimumValue="0" MaximumValue="999" Enabled="False"></asp:RangeValidator>
                                    </td>
                                    <td colspan="3" style="text-align: left; vertical-align: middle">
                                        <div id="srcMDiv" class="form-group" runat="server">
                                            <div class="input-group">
                                                <input id="srcBox" runat="server" class="form-control" disabled="disabled" enableviewstate="True" type="text" value="Selected (None)" visible="True" />
                                                <asp:RadioButtonList ID="srcRadio" runat="server" AutoPostBack="True" Visible="False" RepeatDirection="Horizontal" Width="100%" Enabled="False" >
                                                    <asp:ListItem></asp:ListItem>
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <span class="input-group-btn">
                                                <asp:Button ID="srcButton" runat="server" CssClass="btn btn-primary" Enabled="false" Font-Bold="False" Text="Search" OnClick="srcButton_Click" />
                                                </span>
                                            </div>
                                        </div>
                                        <asp:RequiredFieldValidator ID="srcBoxValidator" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" Text="*" ControlToValidate="srcBox"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="srcRadioValidator" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" Text="*" ControlToValidate="srcRadio"></asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="srcBoxRange" runat="server" ErrorMessage="Out of bounce." ControlToValidate="srcBox" Display="Dynamic" Type="Double" MinimumValue="1" MaximumValue="99999"></asp:RangeValidator>
                                    </td>
                                </tr>  
                                <tr>  
                                    <td style="text-align: right; ">
                                        Product Type:
                                    </td>  
                                    <td style="text-align: left; vertical-align: middle;">
                                        <asp:RadioButtonList ID="mcdProductType" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome" AutoPostBack="True">
                                            <asp:ListItem Value="45 Days">45 Days</asp:ListItem>
                                            <asp:ListItem Value="9 Days">9 Days</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="mcdReqPType" runat="server" ErrorMessage="Chicken birthday cannot be empty." Text="*" ControlToValidate="mcdProductType" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True" Enabled="False"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="text-align: left; vertical-align: middle"><asp:Button ID="mcdSave" runat="server" Text="save" CssClass="btn btn-success btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" OnClick="mcdSave_Click" />

                                    </td>
                                    <td>
                                        <asp:Button ID="mcdClear" runat="server" Text="clear" CssClass="btn btn-warning btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" OnClick="mcdClear_Click" CausesValidation="false" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>  
                                <tr>  
                                    <td style="text-align: right" colspan="5">
                                        <asp:HiddenField ID="mcdSelectedID" runat="server" Visible="False" />
                                    </td>  
                                </tr>  
                            </table>
                        </div>
                        <br />
                        <asp:GridView ID="mcdGridOut" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive table-hover" Width="100%" GridLines="Vertical" EmptyDataText="No Data Record Found." AllowSorting="True" HorizontalAlign="Center" >
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" InsertVisible="False" ItemStyle-Width="40" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                <asp:BoundField DataField="chickenType" HeaderText="TYPE" SortExpression="chickenType" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="chickenBirthday" HeaderText="BIRTHDAY" SortExpression="chickenBirthday" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="chickenBirthWeight" HeaderText="BIRTH WEIGHT" SortExpression="chickenBirthWeight" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="productType" HeaderText="PRODUCT TYPE" SortExpression="productType" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" Text="Select" OnClick="mcdRowSelect_Click" />
                                    </ItemTemplate>
                                    <ControlStyle CssClass="btn btn-default" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="mcdDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="mcdDelete_Click1" OnClientClick="return confirm('Are you sure you want to delete this?')" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                            </Columns>
                            <HeaderStyle CssClass="table-header" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:GridView>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="srcBy" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
