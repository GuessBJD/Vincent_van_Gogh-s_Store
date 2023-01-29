<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Assignment_2.Shop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MY_STORE</title>
    <link href="Resources/main.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Big+Shoulders+Display:wght@200;500;700&family=Dancing+Script:wght@400;600;700&family=Grandstander:wght@400;500;700&family=Oswald:wght@400;700&family=Playfair+Display:ital,wght@1,400;1,500;1,700&family=Raleway:wght@600;900&family=Roboto+Slab:wght@500;700&family=Sansita+Swashed:wght@400;700&family=Yanone+Kaffeesatz:wght@300;500;700&display=swap" rel="stylesheet" />
</head>
<body>
    <section id="HEADER">
        <div>
            <h1 class="font">Vincent van Gogh's Store</h1>
        </div>        
    </section>

    <section id="BODY">
        <form runat="server">
            <asp:MultiView ID="ShopMultiView" runat="server">
                <asp:View ID="Browse" runat="server">
                    <div class="width-85per">
                        <table class="button-font table-100per">
                            <tr>
                                <td width="100%"></td>
                                <td><asp:Button ID="Button1" runat="server" Text="Basket" OnClick="Basket_Click" Class="btn btn-warning margin-15px" /></td>
                            </tr>
                        </table>                       
                    </div>
                    <div class="width-50per" style="padding-bottom: 55px">
                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" CssClass="dataList-100per">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%#((productData)Container.DataItem).imgURL%>' Width="480" Height="381" CommandName="productDetailsLook" CommandArgument='<%#((productData)Container.DataItem).id%>' OnCommand="ImageBtn_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text='<%#((productData)Container.DataItem).productName%>' CssClass="product-name-font"></asp:Label></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </asp:View>

                <asp:View ID="ProductDetails" runat="server">
                    <div class="width-85per">
                        <table class="button-font table-100per">
                            <tr>
                                <td width="100%"><asp:Button ID="Button5" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click" Class="btn btn-warning margin-15px" /><br /></td>
                                <td><asp:Button ID="Button6" runat="server" Text="Basket" OnClick="Basket_Click" Class="btn btn-warning margin-15px" /><br /></td>
                            </tr>
                        </table>
                    </div>
                    <div class="width-50per" style="padding-bottom: 55px">
                        <table class="center">
                            <tr>
                                <!--<asp:Label ID="Label11" runat="server" Text="ID" Visible="false"></asp:Label>-->
                                <th colspan="3">
                                    <input id="HiddenProductID" type="hidden" runat="server"/>
                                    <asp:Label ID="Label1" runat="server" Text="PRODUCT_NAME" CssClass="product-name-font"></asp:Label>
                                </th>
                            </tr>
                            <tr>
                                <td colspan="3"><asp:Image ID="Image1" runat="server" alt="PRODUCT_IMAGE" Width="768" Height="609"/></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div style="text-align: justify">
                                        <asp:Label ID="Label2" runat="server" Text="PRODUCT_DESCRIPTION" CssClass="product-description-font"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="text-align: left;"><asp:Label ID="Label3" runat="server" Text="PRODUCT_PRICE" CssClass="product-description-font"></asp:Label></td>
                            </tr>
                            <tr>
                                <td width="300px">
                                    <div style="text-align: left;">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">Without frame (+ $0)</asp:ListItem>
                                            <asp:ListItem>With frame (+ $1000)</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </td>
                                <td width="300px">
                                    <asp:Button ID="Button2" runat="server" Text="-" OnClick="ReduceAmount_Click" Class="btn btn-warning" />
                                    <asp:Label ID="Label4" runat="server" Text="AMOUNT" Width="100px" style="border: 3px solid #F0C147;"></asp:Label>
                                    <asp:Button ID="Button3" runat="server" Text="+" OnClick="AddAmount_Click" Class="btn btn-warning" />
                                </td>
                                <td width="300px">
                                    <div style="text-align: right;" class="button-font">
                                        <asp:Button ID="Button4" runat="server" Text="Add to Basket" AutoPostBack="True" OnClick="AddToBasket_Click" Class="btn btn-warning" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>

                <asp:View ID="Basket" runat="server">
                    <div class="width-85per">
                        <table class="button-font">
                            <tr>
                                <td width="100%"><asp:Button ID="Button7" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click" CssClass="btn btn-warning margin-15px" /><br /></td>
                            </tr>
                        </table>
                    </div>
                    <div style="width: 50%; margin: 0 auto; text-align: center; padding-bottom: 55px;">
                        <div>
                            <table class="basket-font" style="table-layout:fixed">
                                <tr colspan="4" class="table-bottom-line">
                                    <th>Purchase List</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <HeaderTemplate>
                                                <table style="table-layout:fixed">
                                                    <tr class="table-bottom-line">
                                                        <th width="200">Product ID</th>
                                                        <th width="450">Product Name</th>
                                                        <th width="200">Frame</th>
                                                        <th width="200">Price</th>
                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><asp:Label ID="Label6" runat="server" Text='<%#((Order)Container.DataItem).productID%>'></asp:Label></td>
                                                    <td><div style="text-align: left;"><asp:Label ID="Label7" runat="server" Text='<%#((Order)Container.DataItem).productName%>'></asp:Label></div></td>
                                                    <td><asp:Label ID="Label8" runat="server" Text='<%#((Order)Container.DataItem).frame == true ? 1 : 0%>'></asp:Label></td>
                                                    <td><asp:Label ID="Label9" runat="server" Text='<%#string.Concat("$ ", ((Order)Container.DataItem).price)%>'></asp:Label></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="Label12" runat="server" Text="Empty Basket :c"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-top-line table-bottom-line-double">
                                    <th colspan="3">Total</th>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <br />
                            <table class="button-font">
                                <tr>
                                    <td width="100%"></td>
                                    <td>
                                        <asp:Button ID="Button12" runat="server" Text="Remove All" OnClick="Cancel_Click" Class="btn btn-warning button-font" Width="110px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%"></td>
                                    <td>
                                        <asp:Button ID="Button14" runat="server" Text="Place Order" OnClick="Order_Click" Class="btn btn-warning button-font" Width="110px" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="PlaceOrder" runat="server">
                    <div class="width-85per">
                        <table class="button-font">
                            <tr>
                                <td width="100%"><asp:Button ID="Button10" runat="server" Text="Continue Shopping" OnClick="ContinueShopping_Click" Class="btn btn-warning margin-15px" /><br /></td>
                                <td><asp:Button ID="Button11" runat="server" Text="Cancel" OnClick="Basket_Click" Class="btn btn-warning margin-15px" /><br /></td>
                            </tr>
                        </table>
                    </div>
                    <div class="width-50per" style="padding-bottom: 55px;">
                        <table class="center order-font" style="vertical-align: middle;">
                            <tr>
                                <th colspan="3">Thank You For Your Support!</th>
                            </tr>
                            <tr class="margin-10px table-bottom-line-double-1">
                                <td>Total</td>
                                <td colspan="2"><asp:Label ID="Label13" runat="server" Text="Label"></asp:Label><input id="Hidden1" type="hidden" value='<%= Label13.Text %>' /></td>
                            </tr>
                            <tr>
                                <td colspan="3">Contact Details</td>
                            </tr>
                            <tr class="margin-10px">
                                <td width="300px" style="text-align: left;">Name: </td>
                                <td width="750px">
                                    <asp:TextBox ID="Name" runat="server" ValidationGroup="PersonalInfo" Width="550px" Height="25px"></asp:TextBox>
                                </td>
                                <td width="300px">
                                    <div style="text-align: left;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Required Field" ControlToValidate="Name" ValidationGroup="PersonalInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>   
                                </td>
                            </tr>
                            <tr class="margin-10px">
                                <td style="text-align: left;">Phone Number: </td>
                                <td>
                                    <asp:TextBox ID="PhoneNo" runat="server" Width="550px" Height="25px"></asp:TextBox>
                                </td>
                                <td>
                                    <div style="text-align: left;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhoneNo" runat="server" ErrorMessage="Required Field" ControlToValidate="PhoneNo" ValidationGroup="PersonalInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="PhoneNoValidator" runat="server" ErrorMessage="Invalid Phone Number" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[\.| |\-]{0,1}|^[0-9]{3}[\.|\-| ]?)?[0-9]{3}(\.|\-| )?[0-9]{4}$" ControlToValidate="PhoneNo" ValidationGroup="PersonalInfo" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr class="margin-10px">
                                <td style="text-align: left;">Email: </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" ValidationGroup="PersonalInfo" Width="550px" Height="25px"></asp:TextBox>
                                </td>
                                <td>
                                    <div style="text-align: left;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Required Field" ControlToValidate="Email" ValidationGroup="PersonalInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid Email Address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" ValidationGroup="PersonalInfo" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">Shipping Address</td>
                            </tr>
                            <tr class="margin-10px">
                                <td style="text-align: left;">Address: </td>
                                <td>
                                    <asp:TextBox ID="Adress" runat="server" ValidationGroup="PersonalInfo" Width="550px" Height="55px"></asp:TextBox>
                                </td>
                                <td>
                                    <div style="text-align: left;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAdress" runat="server" ErrorMessage="Required Field" ControlToValidate="Adress" ValidationGroup="PersonalInfo" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="button-font margin-15px">
                                    <br />
                                    <asp:Button ID="Button9" runat="server" Text="Submit" ValidationGroup="PersonalInfo" OnClick="Submit_Click" Class="btn btn-warning" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
        </form>

    </section>

</body>
</html>
