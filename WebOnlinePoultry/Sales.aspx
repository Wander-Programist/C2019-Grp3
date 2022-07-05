
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="WebOnlinePoultry.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-5">
            <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Sales Page Manager</h1>
            <table align="center" cellpadding="0" cellspacing="0" style="width: 100%; float: left" class="table custom">
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
                        <asp:DropDownList ID="ddlVolumeType" runat="server" style="max-width: 280px" CssClass="form-control" AutoPostBack="True" Enabled="False"></asp:DropDownList></td>
                    </td>
                </tr>
                <tr>
                    <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                        <asp:Label ID="labelVolume" runat="server" Text="Nan:" Font-Bold="True" Font-Size="Large"></asp:Label>
                    </td>
                    <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: center; table-layout: auto;">
                        <asp:TextBox ID="TBVolume" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Input cannot be less than 0." Display="Dynamic" ControlToValidate="TBVolume" Text="*" MinimumValue="0" MaximumValue="999" CssClass="text-danger"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input Field cannot be empty." ControlToValidate="TBVolume" Display="Dynamic" Text="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-warning" Font-Bold="True" Font-Size="Large" Text="Update Data" ToolTip="Add New Sale's Data." OnClientClick="return confirm('Are you sure you want to UPDATE this?')" Width="100%" style="max-width: 280px" Enabled="False" />

                    </td>
                    <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: left;">
                        <asp:Button ID="btnAddSale" runat="server" style="max-width: 280px" CssClass="btn btn-primary" Font-Bold="True" Font-Size="Large" Text="Add Data" ToolTip="Add New Sale's Data." Width="100%" Enabled="False" />
                    </td>
                </tr>
                <tr>
                    <td style="font-variant: small-caps; vertical-align: middle; text-align: right">
                        <asp:HiddenField ID="SubIdentifier" runat="server" />
                        <asp:HiddenField ID="QuerySaver" runat="server" />
                    </td>
                    <td style="font-size: medium; font-weight: bold; vertical-align: middle; text-align: left;"></td>
                </tr>
                <tr>
                    <td style="font-variant: small-caps; vertical-align: middle; text-align: center" colspan="2">
                        <asp:Label ID="testOut" runat="server" Text="No Syntax"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <%--<div class="col-md-6">
            <h1>Hello</h1>
            <asp:SqlDataSource ID="SqlSourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT * FROM [SalesDB]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSourceSales" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="productType" HeaderText="productType" SortExpression="productType" />
                    <asp:BoundField DataField="categoryName" HeaderText="categoryName" SortExpression="categoryName" />
                    <asp:BoundField DataField="volumeType" HeaderText="volumeType" SortExpression="volumeType" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="pricing" HeaderText="pricing" SortExpression="pricing" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                </Columns>
            </asp:GridView>
        </div>--%>
    </div>
</asp:Content>
