<%@ Page Title="Chicken Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChickenProfile.aspx.cs" Inherits="WebOnlinePoultry.Database" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <div class="col-md-3">
                <h3 style="font-weight:bolder">
                    Create New Data</h3>
                <table class="table table-condensed">   
                    <tr>  
                        <td style="width: inherit;">Chicken Type:</td>  
                            <td style="width: 100%">
                                <asp:RadioButtonList ID="CType" runat="server" RepeatDirection="Horizontal" Width="100%">
                                    <asp:ListItem>Layer</asp:ListItem>
                                    <asp:ListItem>Broiler</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chicken type cannot be empty." ControlToValidate="CType" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Birthday:
                        </td>  
                        <td aria-orientation="horizontal" style="width: 100%">  
                            <asp:TextBox ID="CBirthD" runat="server" Width="100%" type="date" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chicken birthday cannot be empty." ControlToValidate="CBirthD" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Birth Weight:
                        </td>  
                        <td style="width: 100%">  
                            <asp:TextBox ID="CBirthW" runat="server" Width="100%" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chicken birthday weight cannot be empty." ControlToValidate="CBirthW" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Chicken Breed:
                        </td>  
                        <td style="width: 100%">  
                            <asp:RadioButtonList ID="CBreed" runat="server" CssClass="radio, pull-left" RepeatDirection="Horizontal" Width="100%">
                                <asp:ListItem>Rooster</asp:ListItem>
                                <asp:ListItem>Hen</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chicken breed cannot be empty." ControlToValidate="CBreed" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td style="width: inherit;">
                            Product Type:
                        </td>  
                        <td style="width: 100%">  
                            <asp:RadioButtonList ID="ProductType" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="radio, pull-left">
                                <asp:ListItem Value="45 Days">45Days</asp:ListItem>
                                <asp:ListItem Value="Egg">EGG</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Product type cannot be empty." ControlToValidate="ProductType" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>  
                    <tr>  
                        <td colspan="2">  
                            <strong>  
                            <asp:Button ID="createChicProf" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="Button1_Click" style="font-weight: bold" Width="100%" />
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ChickenProfile]" OldValuesParameterFormatString="original_{0}">
                </asp:SqlDataSource>
                <div style="width: 100%; height: 68vh; overflow-y:auto">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="1" Font-Size="Large" Width="100%" AllowSorting="True" CssClass="table table-hover table-responsive" GridLines="Vertical" >
                        <%--<AlternatingRowStyle BackColor="#F0F0F0" />--%>
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
                    </Columns>
                    <HeaderStyle CssClass="table-header" ForeColor="white"/>
                </asp:GridView>
                </div>
            </div>
        </ContentTemplate></asp:UpdatePanel>

        <div class="col-md-12">
            <h1>Manage Chicken Database</h1>
            <div>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <table style="width:100%; " class="table table-condensed table-responsive">
                    <tr>  
                        <td style="text-align: right; width: auto;">Chicken Type:</td>  
                        <td style="text-align: center; vertical-align: middle;">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome" Font-Size="Medium" ToolTip="Types of Chicken" Height="100%">
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
                            <asp:TextBox ID="TextBox1" runat="server" type="date" CssClass="form-control" ></asp:TextBox>
                        </td>  
                        <td colspan="3">
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="100%" CssClass="form-control control-label" >
                                <asp:ListItem>CHICKEN ID</asp:ListItem>
                                <asp:ListItem>CHICKEN TYPE</asp:ListItem>
                                <asp:ListItem>CHICKEN BIRTHDAY</asp:ListItem>
                                <asp:ListItem>CHICKEN BIRTH WEIGHT</asp:ListItem>
                                <asp:ListItem>CHICKEN BREED</asp:ListItem>
                                <asp:ListItem>PRODUCT TYPE</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right; width: auto;">
                            Chicken Birth Weight:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" max-width="auto"></asp:TextBox>
                        </td>
                        <td style="vertical-align: middle; text-align: center" colspan="3">
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary pull-left" Font-Bold="False" />
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
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="form-control-custome radio-custome" RepeatDirection="Horizontal">
                                <asp:ListItem>Rooster</asp:ListItem>
                                <asp:ListItem>Hen</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td><asp:Button ID="mcdSave" runat="server" Text="save" CssClass="btn btn-success btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" />

                        </td>
                        <td>
                            <asp:Button ID="mcdClear" runat="server" Text="clear" CssClass="btn btn-warning btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;" />
                        </td>
                        <td>
                            <asp:Button ID="mcdDelte" runat="server" Text="delete" CssClass="btn btn-danger btn-text-custom" Font-Bold="True" Font-Size="XX-Large" style="padding: 0 10px 10px 10px; line-height: 1;"/>
                        </td>
                    </tr>  
                    <tr>  
                        <td style="text-align: right">
                            Product Type:
                        </td>  
                        <td style="text-align: center; vertical-align: middle;">  
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" CssClass="form-control-custome radio-custome">
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
