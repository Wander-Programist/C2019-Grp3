<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebOnlinePoultry.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-5">
            <h1 style="padding: 10px 0px 10px 20px; font-weight: bold; font-variant: small-caps; font-family: Poppins; vertical-align: middle; background-color: #CCCCCC">Product Page Manager</h1>
            <table align="center" style="vertical-align: middle; height: 100%; width: 100%" class="table table-striped">
                <tr>
                    <td style="font-size: medium; font-weight: bold; font-variant: small-caps; text-align: right; vertical-align: middle;">Product Type:</td>
                    <td style="vertical-align: bottom; text-align: left;">
                        <asp:DropDownList ID="ddlPType" runat="server" CssClass="form-control" Width="100%" OnSelectedIndexChanged="ddlPType_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Selected="True">(None)</asp:ListItem>
                            <asp:ListItem Value="Egg">EGG</asp:ListItem>
                            <asp:ListItem Value="Whole">Whole Chicken</asp:ListItem>
                            <asp:ListItem Value="Parts">Chicken Parts</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="font-size: medium; font-weight: bold; font-variant: small-caps; text-align: right; vertical-align: middle; height: 57px;"></td>
                    <td style="vertical-align: bottom; text-align: left; height: 57px;">
                        <asp:DropDownList ID="ddlSType" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlSType_SelectedIndexChanged">
                            <asp:ListItem>(None)</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td runat="server" id="labelQK" style="font-size: medium; font-weight: bold; font-variant: small-caps; text-align: right; vertical-align: middle;">Kilo/s:</td>
                    <td style="vertical-align: bottom; text-align: left;">
                        <asp:TextBox ID="TBKiloQuanty" runat="server" Width="100%" CssClass="form-control" Enabled="False" TextMode="Number" style="max-width: 280px;" ></asp:TextBox>
                        <asp:RangeValidator ID="RanKiloQuanty" runat="server" ErrorMessage="Input cannot be negative." MinimumValue="1" MaximumValue="999" ControlToValidate="TBKiloQuanty" Display="Dynamic" Enabled="False" CssClass="text-warning">*</asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="ReqKiloQuanty" runat="server" ErrorMessage="Cannot be empty." ControlToValidate="TBKiloQuanty" Display="Dynamic" Enabled="False" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3 runat="server" id="testOut"></h3>
                        <asp:HiddenField ID="updateQuery" runat="server" Value="" Visible="False" />
                    </td>
                    <td style="vertical-align: bottom; text-align: left;">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Data" CssClass="btn btn-primary" style="max-width: 280px" Width="100%" OnClick="btnUpdate_Click" Enabled="False" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-7">
            <h4 style="font-weight: bold; font-variant: small-caps; ">Available Eggs</h4>
            <asp:SqlDataSource ID="SqlSourceEgg" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT * FROM [EggSizesAvailable]"></asp:SqlDataSource>
            <asp:GridView ID="EggDB" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSourceEgg" Width="100%" >
                <Columns>
                    <asp:BoundField DataField="EggSizes" HeaderText="Sizes" SortExpression="EggSizes">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Medium" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Last Update" SortExpression="Date">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
             <h4 style="font-weight: bold; font-variant: small-caps; ">Available Whole Chicken</h4>
            <asp:SqlDataSource ID="SqlSourceWholeChicken" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT * FROM [WholeChickenAvailable]"></asp:SqlDataSource>
            <asp:GridView ID="WholeChickenDB" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSourceWholeChicken" Width="100%">
                <Columns>
                    <asp:BoundField DataField="WholeType" HeaderText="Type" SortExpression="WholeType">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Last Update" SortExpression="Date">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
             <h4 style="font-weight: bold; font-variant: small-caps; ">Available Chicken Parts</h4>
            <asp:SqlDataSource ID="SqlSourceChickenParts" runat="server" ConnectionString="<%$ ConnectionStrings:ChickenProfileDB %>" SelectCommand="SELECT * FROM [ChickenPartsAvailable]"></asp:SqlDataSource>
            <asp:GridView ID="ChickenPartsDB" runat="server" AutoGenerateColumns="False" DataSourceID="SqlSourceChickenParts" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ChickenParts" HeaderText="Parts" SortExpression="ChickenParts">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Kilos" HeaderText="Kilos" SortExpression="Kilos">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date">
                        <HeaderStyle CssClass="table-header" Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Large" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-header" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
