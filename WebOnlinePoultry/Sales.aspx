
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="WebOnlinePoultry.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-5">
                    <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Sales Page Manager</h1>
                    <table style="width: 100%; float: left" class="table custom">
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                                <asp:Label runat="server" Text="Product Type:" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlPType" runat="server" style="max-width: 280px" CssClass="form-control ddl-custom" AutoPostBack="True" OnSelectedIndexChanged="ddlPType_SelectedIndexChanged">
                                    <asp:ListItem Selected="True">(None)</asp:ListItem>
                                    <asp:ListItem Value="Egg">Egg</asp:ListItem>
                                    <asp:ListItem Value="Whole">Whole Chicken</asp:ListItem>
                                    <asp:ListItem Value="Parts">Chicken Parts</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right; height: 49px;">
                                <asp:Label ID="labelSubName" runat="server" Text="Nan:" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                            <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: center; table-layout: auto; height: 49px;">
                                <asp:DropDownList ID="ddlSPType" runat="server" style="max-width: 280px" CssClass="form-control" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                                <asp:Label ID="labelVolumeType" runat="server" Text="Nan:" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                            <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: center; table-layout: auto;">
                                <asp:DropDownList ID="ddlVolumeType" runat="server" style="max-width: 280px" CssClass="form-control" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlVolumeType_SelectedIndexChanged"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                                <asp:Label ID="labelVolume" runat="server" Text="Nan:" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                            <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: center; table-layout: auto;">
                                <asp:TextBox ID="TBVolume" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Input cannot be less than 0." Display="Dynamic" ControlToValidate="TBVolume" Text="*" MinimumValue="1" MaximumValue="999" CssClass="text-danger" Enabled="False"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input Field cannot be empty." ControlToValidate="TBVolume" Display="Dynamic" Text="*" CssClass="text-danger" Enabled="False"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                                &nbsp;</td>
                            <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: left;">
                                <asp:Button ID="btnAddSale" runat="server" style="max-width: 280px" CssClass="btn btn-primary" Font-Bold="True" Font-Size="Large" Text="Add Data" ToolTip="Add New Sale's Data." Width="100%" Enabled="False" OnClick="btnAddSale_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                                <asp:HiddenField ID="SubIdentifier" runat="server" />
                                <asp:HiddenField ID="QuerySaver" runat="server" />
                                <asp:HiddenField ID="volType" runat="server" />
                            </td>
                            <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: left;"></td>
                        </tr>
                        <tr>
                            <td style="font-variant: small-caps; vertical-align: middle; text-align: center" colspan="2">
                            </td>
                        </tr>
                    </table>
                </div>
                <h4 style="font-weight: bold; font-variant: small-caps; ">Sale History</h4>
                <div class="col-md-7" style="height: 62.2vh; overflow-y:auto">
                    <asp:SqlDataSource ID="SqlSourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT Id, productType, categoryName, volumeType, quantity, FORMAT (CAST(CurrentDate AS DATE), 'dd-MMM-yyyy') as date, pricing, Totals FROM SaleDB"></asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSourceSales" Width="100%" DataKeyNames="Id" CssClass="table table table-hover table-responsive" AllowSorting="True" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" SortExpression="Id" InsertVisible="False" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="productType" HeaderText="Product Type" SortExpression="productType" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="categoryName" HeaderText="Category Name" SortExpression="categoryName" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="volumeType" HeaderText="Volume Type" SortExpression="volumeType" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" ReadOnly="True" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pricing" HeaderText="Pricing" SortExpression="pricing" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Totals" HeaderText="Totals" SortExpression="Totals" ReadOnly="True" />
                        </Columns>
                        <HeaderStyle CssClass="table-header" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#CCFFFF" />
                        <SortedDescendingCellStyle BackColor="#FFCCFF" />
                    </asp:GridView>
                </div>
            </div>

<%--========================================================================================================================================--%>

            <div class="col-lg-12" style="height: 50vh; overflow-y: auto">
                <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Search Data</h1>
                <div class="col-md-5">
                    <table class="table">
                        <tr>
                            <td class="table-header" style="font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF; vertical-align: middle; text-align: center">
                                <asp:Label ID="LabelType" runat="server" Text="Type"></asp:Label>
                            </td>
                            <td class="table-header" style="font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF; vertical-align: middle; text-align: center">
                                <asp:Label ID="LabelSBy" runat="server" Text="Identity"></asp:Label>
                            </td>
                            <td class="table-header" style="font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF; vertical-align: middle; text-align: center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle; text-align: center; padding-right: 10px; padding-left: 10px">
                                <asp:DropDownList ID="ddlSearchType" runat="server" style="width: 100%; min-width: 130px; max-width: 165px" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged" >
                                    <asp:ListItem>--(Select)--</asp:ListItem>
                                    <asp:ListItem Value="Id">ID</asp:ListItem>
                                    <asp:ListItem Value="productType">Product Type</asp:ListItem>
                                    <asp:ListItem Value="categoryName">Category Name</asp:ListItem>
                                    <asp:ListItem Value="volumeType">Volume Type</asp:ListItem>
                                    <asp:ListItem Value="quantity">Quantity</asp:ListItem>
                                    <asp:ListItem Value="CurrentDate">Date</asp:ListItem>
                                    <asp:ListItem Value="pricing">Price</asp:ListItem>
                                    <asp:ListItem>Totals</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="vertical-align: middle; text-align: center; padding-right: 10px; padding-left: 10px">
                                <input id="TBSearchIdent" runat="server" class="form-control" style="width: 100%; min-width: 130px; max-width: 165px" disabled="disabled" enableviewstate="True" type="text" visible="True" />
                                <asp:DropDownList ID="ddlSearchIdent" runat="server" style="width: 100%; min-width: 130px; max-width: 165px" CssClass="form-control" AutoPostBack="True" Enabled="False" Visible="False" >
                                </asp:DropDownList>
                            </td>
                            <td style="vertical-align: middle; text-align: center; padding-right: 10px; padding-left: 10px">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" style="width: 100%; max-width: 280px" Enabled="False" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="testOut" runat="server" Text="No Syntax"></asp:Label>
                            </td>
                            <td>
                                <asp:RangeValidator ID="RangeSearch" runat="server" ErrorMessage="Input must be greater than 1." ControlToValidate="TBSearchIdent" CssClass="text-danger" Enabled="False" MaximumValue="999" MinimumValue="1">*</asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredSearch" runat="server" ErrorMessage="Input cannot be empty" ControlToValidate="TBSearchIdent" CssClass="text-warning" Enabled="False">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:HiddenField ID="SQuery" runat="server" Visible="False" />
                                <asp:HiddenField ID="HQuery" runat="server" Visible="False" />
                                <asp:HiddenField ID="SUBQuery" runat="server" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-7">
                    <asp:GridView ID="SalesSearch" runat="server"></asp:GridView>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
