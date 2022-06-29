<%@ Page Title="Chicken Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChickenProfile.aspx.cs" Inherits="WebOnlinePoultry.Database" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <div class="col-md-3">
                <h3 style="font-weight:bolder">
                    Create New Data</h3>
                <asp:Label ID="textWarning" runat="server" Text=""></asp:Label>
                <table class="table table-condensed">   
                    <tr>  
                        <td style="width: inherit;">Chicken Type:</td>  
                            <td style="width: 100%">
                                <asp:RadioButtonList ID="CType" runat="server" RepeatDirection="Horizontal" Width="100%">
                                    <asp:ListItem>Layer</asp:ListItem>
                                    <asp:ListItem>Broiler</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chicken type cannot be empty." Text="*" ControlToValidate="CType" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Birthday:
                        </td>  
                        <td aria-orientation="horizontal" style="width: 100%">  
                            <asp:TextBox ID="CBirthD" runat="server" Width="100%" TextMode="Date" placeholder="Month/Day/Year" DateFormatString="" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chicken birthday cannot be empty." Text="*" ControlToValidate="CBirthD" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Birth Weight:
                        </td>  
                        <td style="width: 100%">  
                            <asp:TextBox ID="CBirthW" runat="server" Width="100%" TextMode="number" placeholder="0" CssClass="form-control" OnTextChanged="CBirthW_TextChanged" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chicken birth weight cannot be empty." Text="*" ControlToValidate="CBirthW" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Number should be greater than 0." ControlToValidate="CBirthW" Display="Dynamic" Type="Double" MinimumValue="0" MaximumValue="999"></asp:RangeValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Breed:
                        </td>  
                        <td style="width: 100%">  
                            <asp:RadioButtonList ID="CBreed" runat="server" CssClass="radio, pull-left" RepeatDirection="Horizontal" Width="100%" required="required">
                                <asp:ListItem>Rooster</asp:ListItem>
                                <asp:ListItem>Hen</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chicken breed cannot be empty." Text="*" ControlToValidate="CBreed" CssClass="text-danger" ValidationGroup="AllValidators" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Product Type:
                        </td>  
                        <td style="width: 100%">  
                            <asp:RadioButtonList ID="ProductType" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="radio, pull-left" required="required">
                                <asp:ListItem Value="45 Days">45Days</asp:ListItem>
                                <asp:ListItem Value="Egg">EGG</asp:ListItem>
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
        
            <div class="col-md-9" style="overflow:auto">
                <h3 style="font-weight:bolder">Database Section</h3>
                <h5 style="font-weight:bolder">Status:&nbsp;
                    <asp:Label ID="dbUpdater" runat="server" Text=""></asp:Label>
                </h5>

                <div style="width: 100%; height: 60vh; overflow-y:auto">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT * FROM [ChickenProfile]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" Font-Size="Large" Width="100%" AllowSorting="True" CssClass="table table-hover table-responsive" GridLines="Vertical" DataKeyNames="Id" DataSourceID="SqlDataSource1" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="chickenType" HeaderText="TYPE" SortExpression="chickenType" />
                            <asp:BoundField DataField="chickenBirthday" HeaderText="BIRTHDAY" SortExpression="chickenBirthday" />
                            <asp:BoundField DataField="chickenBirthWeight" HeaderText="BIRTH WEIGHT" SortExpression="chickenBirthWeight" />
                            <asp:BoundField DataField="chickenBreed" HeaderText="BREED" SortExpression="chickenBreed" />
                            <asp:BoundField DataField="productType" HeaderText="PRODUCT TYPE" SortExpression="productType" />
                        </Columns>
                    <HeaderStyle CssClass="table-header" ForeColor="white"/>
                </asp:GridView>
                </div>
            </div>
        </ContentTemplate></asp:UpdatePanel>

        <div class="col-md-12">
            <h1>Manage Chicken Database</h1>
            <div class="alert alert-dismissible alert-warning">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4>Warning!</h4>
                <p>Best check yo self, you're not looking too good. Nulla vitae elit libero, a pharetra augue. Praesent commodo cursus magna, <a href="#" class="alert-link">vel scelerisque nisl consectetur et</a>.</p>
            </div>
            <div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <table style="width:100%; " class="table table-condensed table-responsive">
                    <tr>  
                        <td style="text-align: right; width: auto;">Chicken Type:</td>  
                        <td style="text-align: center; vertical-align: middle;">
                            <asp:RadioButtonList ID="mcdType" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome" Font-Size="Medium" ToolTip="Types of Chicken" Height="100%">
                                <asp:ListItem>Layer</asp:ListItem>
                                <asp:ListItem>Broiler</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td colspan="3">
                            <h2 class="form-control-custome label-info" style="margin:0; padding:0; font-weight:bolder; text-align:center; font-variant:small-caps; color: white">search by</h2>
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right; width: auto;">
                            Chicken Birthday:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:TextBox ID="mcdBirthD" runat="server" type="date" CssClass="form-control" ></asp:TextBox>
                        </td>  
                        <td colspan="3">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="form-control control-label" >
                                <asp:ListItem Value="srcID">CHICKEN ID</asp:ListItem>
                                <asp:ListItem Value="srcTYPE">CHICKEN TYPE</asp:ListItem>
                                <asp:ListItem Value="srcBIRTHDAY">CHICKEN BIRTHDAY</asp:ListItem>
                                <asp:ListItem Value="srcBIRTHW">CHICKEN BIRTH WEIGHT</asp:ListItem>
                                <asp:ListItem Value="srcBREED">CHICKEN BREED</asp:ListItem>
                                <asp:ListItem Value="srcPTYPE">PRODUCT TYPE</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right; width: auto;">
                            Chicken Birth Weight:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:TextBox ID="mcdBirthW" runat="server" CssClass="form-control" max-width="auto"></asp:TextBox>
                        </td>
                        <td style="vertical-align: middle; text-align: center" colspan="3">
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="srcBox" runat="server" CssClass="form-control" OnTextChanged="srcBox_TextChanged"></asp:TextBox>
                                    <span class="input-group-btn pull-left">
                                        <asp:Button ID="srcButton" runat="server" Text="Search" CssClass="btn btn-primary" Font-Bold="False" />
                                    </span>
                                </div>
                            </div>
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right; width: auto;">
                            Chicken Breed:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:RadioButtonList ID="mcdBreed" runat="server" CssClass="form-control-custome radio-custome" RepeatDirection="Horizontal">
                                <asp:ListItem>Rooster</asp:ListItem>
                                <asp:ListItem>Hen</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td><asp:Button ID="mcdSave" runat="server" Text="save" CssClass="btn btn-success btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" OnClick="mcdSave_Click" />

                        </td>
                        <td>
                            <asp:Button ID="mcdClear" runat="server" Text="clear" CssClass="btn btn-warning btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" OnClick="mcdClear_Click" />
                        </td>
                        <td>
                            <asp:Button ID="mcdDelte" runat="server" Text="delete" CssClass="btn btn-danger btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" OnClick="mcdDelte_Click" />
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right">
                            Product Type:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:RadioButtonList ID="mcdProductType" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome">
                                <asp:ListItem Value="45 Days">45Days</asp:ListItem>
                                <asp:ListItem Value="Egg">EGG</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td colspan="3">&nbsp;</td>
                    </tr>  
                </table>
            </div>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-hover" Height="50%" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" InsertVisible="False" >
                        <HeaderStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    <asp:BoundField DataField="chickenType" HeaderText="TYPE" SortExpression="chickenType" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="chickenBirthday" HeaderText="BIRTHDAY" SortExpression="chickenBirthday" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="chickenBirthWeight" HeaderText="BIRTH WEIGHT" SortExpression="chickenBirthWeight" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="chickenBreed" HeaderText="BREED" SortExpression="chickenBreed" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="productType" HeaderText="PRODUCT TYPE" SortExpression="productType" >
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id")%>'>LinkButton</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="table-header" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
