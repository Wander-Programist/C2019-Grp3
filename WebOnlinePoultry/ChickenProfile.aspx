<%@ Page Title="Chicken Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChickenProfile.aspx.cs" Inherits="WebOnlinePoultry.Database" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <h1 style="font-weight: 900; text-align:center">Chicken Profile</h1>
        <div class="row">
            <div class="col-md-3">
                <h3 style="font-weight:bolder">
                    Create New Data</h3>
                <table class="table">   
                <tr>  
                    <td style="width: inherit;">Chicken Type:</td>  
                     <td>
                         <asp:RadioButtonList ID="CType" runat="server" RepeatDirection="Horizontal" Width="100%">
                             <asp:ListItem>Layer</asp:ListItem>
                             <asp:ListItem>Broiler</asp:ListItem>
                         </asp:RadioButtonList>
                     </td>  
                </tr>  
                <tr>  
                    <td style="width: inherit;">
                        Chicken Birthday:
                    </td>  
                    <td aria-orientation="horizontal">  
                        <asp:TextBox ID="CBirthD" runat="server" Width="100%"></asp:TextBox> 
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/calendar.png" DescriptionUrl="Calendar Picker" Height="20px" Width="20px" ImageAlign="AbsBottom" OnClick="ImageButton1_Click" />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender">
                        </asp:Calendar>
                    </td>  
                </tr>  
                <tr>  
                    <td style="width: inherit;">
                        Chicken Birth Weight:
                    </td>  
                    <td>  
                        <asp:TextBox ID="CBirthW" runat="server" Width="100%"></asp:TextBox> 
                    </td>  
                </tr>  
                <tr>  
                    <td style="width: inherit;">
                        Chicken Breed:
                    </td>  
                    <td>  
                        <asp:RadioButtonList ID="CBreed" runat="server" CssClass="radio, pull-left" RepeatDirection="Horizontal" Width="100%">
                            <asp:ListItem>Rooster</asp:ListItem>
                            <asp:ListItem>Hen</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>  
               </tr>  
                <tr>  
                    <td style="width: inherit;">
                        Product Type:
                    </td>  
                    <td>  
                        <asp:RadioButtonList ID="ProductType" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="radio, pull-left">
                            <asp:ListItem Value="45 Days">45Days</asp:ListItem>
                            <asp:ListItem Value="Egg">EGG</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>  
                </tr>  
                <tr>  
                    <td style="width: inherit;">  
                        <strong>  
                        <asp:Button ID="createChicProf" runat="server" Text="Create" CssClass="btn-success" Width="100%" OnClick="Button1_Click" style="font-weight: bold" />
                        </strong>
                    </td>  
                </tr>  
            </table>
            </div>

            <div class="col-md-9">
                <h3 style="font-weight:bolder">Database Section</h3>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ChickenProfile]" OldValuesParameterFormatString="original_{0}">
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" Width="100%" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" >
                        </asp:BoundField>
                        <asp:BoundField DataField="chickenType" HeaderText="chickenType" SortExpression="chickenType" />
                        <asp:BoundField DataField="chickenBirthday" HeaderText="chickenBirthday" SortExpression="chickenBirthday" />
                        <asp:BoundField DataField="chickenBirthWeight" HeaderText="chickenBirthWeight" SortExpression="chickenBirthWeight" />
                        <asp:BoundField DataField="chickenBreed" HeaderText="chickenBreed" SortExpression="chickenBreed" />
                        <asp:BoundField DataField="productType" HeaderText="productType" SortExpression="productType" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <%--<table style="width:100%" class="table-bordered table-hover" id="ChickenDatabaseOut">
                        <tr>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">ID</th>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">Chicken Type</th>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">Chicken Birthday</th>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">Chicken Birth Weigth</th>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">Chicken Breed</th>
                            <th style="background-color: #000000; text-align:center; font-size: large; font-weight: bold; font-variant: small-caps; color: #FFFFFF;">Product Type</th>
                        </tr>
                        <tr>
                            <td>00</td>
                            <td>Rooster</td>
                            <td>06/25/2022</td>
                            <td>2.5 kg</td>
                            <td>Rooster</td>
                            <td>45 days</td>
                        </tr>
                        <tr>
                            <td>01</td>
                            <td>Hen</td>
                            <td>06/25/2022</td>
                            <td>2.5 kg</td>
                            <td>Hen</td>
                            <td>45 days</td>
                        </tr>
                    </table>--%>
                <br />
                <asp:Label ID="dbUpdater" runat="server" Text="Latest!"></asp:Label>
            </div>
        </div>  
</asp:Content>
