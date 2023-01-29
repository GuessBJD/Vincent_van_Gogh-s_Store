using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;

namespace Assignment_2
{
    public partial class Shop : System.Web.UI.Page
    {
        public class productData
        {
            public int id;
            public string imgURL;
            public string imgURLF;
            public string productName;
            public string productDetails;
            public double price;

            public productData() { }
            public productData(int i, string url, string urlf, string name, string description, double p)
            {
                id = i;
                imgURL = url;
                imgURLF = urlf;
                productName = name;
                productDetails = description;
                price = p;
            }
        }

        public class Order
        {
            public int productID;
            public string productName;
            public bool frame;
            public double price;

            public Order() { }

            public Order(int i, string name, bool b, double p)
            {
                productID = i;
                productName = name;
                frame = b;
                price = p;
            }
        }

        public class OrderList
        {
            public List<Order> orderCatalog;

            public OrderList() { orderCatalog = new List<Order>(); }

            public double total()
            {
                double t = 0.0;

                foreach (var order in orderCatalog)
                {
                    t += order.price;
                }

                return t;
            }
        }

        static int c = 0;
        static List<productData> productList = new List<productData>();
        static OrderList orderEntry = new OrderList();
        static int amount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());

                if (c < 1)
                {
                    productList.Add(new productData(0,
                                                    "Resources/Image/51 Harvest at La Crau, with Montmajour in the Background.jpg",
                                                    "Resources/Image/51 Harvest at La Crau, with Montmajour in the Background_Frame.png",
                                                    "Harvest at La Crau, with Montmajour in the Background<br />Arles: June, 1888",
                                                    "Harvest at La Crau with Montmajour in the Background was painted by Van Gogh in 1888 while he was staying in Arles, France. It depicts the harvest taking place in the countryside around Arles in this fall of 1888. The yellow fields dominate the view, with a few white houses dotting the landscape and the mountains visible in the far background. In between, people are busy with their harvesting activities. The coloring of the painting is bright and idyllic. The houses are bright white with red roofs, the corn golden and the sky very blue. Van Gogh was at this time very happy in Arles and his free used the bright colors to include this happiness and sense of idyllic surroundings in this painting. This also offers a clear difference between Van Gogh the Post - Impressionist and the impressionists, who were always neutral in their observations. Van Gogh does not suffer under this, and makes the scene as nice as he feels it. This movement away from the seen towards the willfully expressed is what would later lead to expressionism.",
                                                    847494.284));
                    productList.Add(new productData(1,
                                                    "Resources/Image/52 Harvest in Provence.jpg",
                                                    "Resources/Image/52 Harvest in Provence_Frame.png",
                                                    "Harvest in Provence<br />Arles: June, 1888",
                                                    "Van Gogh moved to Arles in February 1888, after spending two years in Paris. Amidst the Provençal corn and wheat fields van Gogh’s pictorial style underwent several transformations induced partly by inspiration he drew from Japanese prints and the works of his contemporaries, partly on account of his own temperament and aspiration to capture in paint the colors, tempo and emotive flavor of his new home. Harvest in Provence, most likely painted on the spot shortly before June 20, 1888, depicts a fragment of rural life as van Gogh experienced it on a given summer day in his thirty-fifth year. The painting evokes a state of flux: the brushstrokes in the sky are blown about by a nervous summer wind; the line of the horizon undulates under solar heat; the full-bodied farm buildings in the distance crave to be filled with nature’s produce; and in the foreground the bundles of corn dance in the breeze as a final goodbye to their earthy abode. Humanity’s presence in the picture is limited to a lonely farm-worker indicated with a few strokes of paint. As a whole, however, Harvest in Provence is a eulogy to human life——— a life van Gogh embraced so compassionately that ultimately he let is slip through his fingers.",
                                                    575560.370));
                    productList.Add(new productData(2,
                                                    "Resources/Image/57 Sunset Wheat Fields Near Arles.jpg",
                                                    "Resources/Image/57 Sunset Wheat Fields Near Arles_Frame.png",
                                                    "Sunset: Wheat Fields Near Arles<br />Arles: June, 1888",
                                                    "Though Arles was a small and primarily agricultural-based community, the town did boast some industry, which is seen in the smoking chimneys of this painting. The development of the railway had increased the town's commerce and mode it more accessible, although it still remained essentially provincial. Seen here from across a broad expanse of restless wheat the town's dark silhouetted outline, lit by a giant moon lends it a mysterious, faintly haunting air. Wheat fields were a motif that Van Gogh used numerous times during his career, and they provided him with a perfect subject with which to expand his expressive use of short brushstrokes. In Sunset at Wheat Field, as in most of his paintings of wheat fields, the wheat is moving and restless, defined by swift dabs of paint that contrast with the still, dark and looming presence of the town on the horizon.He had become increasingly preoccupied by the expression of feelings through symbolic elements in his work, and here his first feelings of unrest in Arles are apparent through the dark town on the skyline.",
                                                    710549.722));
                    productList.Add(new productData(3,
                                                    "Resources/Image/60 Wheat Field with Sheaves.jpg",
                                                    "Resources/Image/60 Wheat Field with Sheaves_Frame.png",
                                                    "Wheat Field with Sheave<br />Arles: June, 1888",
                                                    "In February 1888, Vincent van Gogh moved from Paris to Arles, a small town on the Rhône River in the South of France. In Arles, all that had influenced him in Paris-Impressionism, Neo-Impressionism, and Japanese prints-coalesced into a mature style marked by energetic, relief-like impasto and riotous, ebullient color. Wheat Field belongs to the artist's \"Harvest\" series, a group of ten paintings from the last half of June 1888. Distinct horizontal compositional bands lead the eye from the sheaves in the foreground to the rows of wheat in the middle ground, to the trees and houses on the horizon and the sky above. Like his friend and fellow Post-Impressionist Paul Gauguin, van Gogh emphasized personal expression over material reality, and in doing so anticipated twentieth-century Modernism.",
                                                    487161.867));

                    c++;
                }

                DataList1.DataSource = productList;
                DataList1.DataBind();

                Repeater1.DataSource = orderEntry.orderCatalog;
                Repeater1.DataBind();

                Options_Reset();

                ShopMultiView.ActiveViewIndex = 0;

            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }

        protected void Basket_Click(object sender, EventArgs e)
        {
            if (orderEntry.orderCatalog.Count < 1)
                Label12.Visible = true;
            else
                Label12.Visible = false;

            Repeater1.DataSource = orderEntry.orderCatalog;
            Repeater1.DataBind();

            Label10.Text = "$ " + orderEntry.total().ToString();

            ShopMultiView.ActiveViewIndex = 2;
        }

        protected void ContinueShopping_Click(object sender, EventArgs e)
        {
            Options_Reset();
            ShopMultiView.ActiveViewIndex = 0; 
        }

        protected void Order_Click(object sender, EventArgs e)
        {
            if (orderEntry.orderCatalog.Count < 1)
            {
                string message = "Basket Empty";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
            else
            {
                Label13.Text = "$ " + orderEntry.total().ToString();
                ShopMultiView.ActiveViewIndex = 3;
            }
        }

        protected void AddToBasket_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
            {
                int id = Int16.Parse(HiddenProductID.Value);
                string product = productList[id].productName;
                double p = productList[id].price;
                bool f = Convert.ToBoolean(RadioButtonList1.SelectedIndex);

                if (f == true)
                {
                    p += 1000;
                }

                for (int i = 0; i < amount; i++)
                {
                    orderEntry.orderCatalog.Add(new Order(id, product, f, p));
                }

                string message = "Added to Basket";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                Options_Reset();

                Image1.ImageUrl = productList[id].imgURL;
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());
            }            
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            orderEntry.orderCatalog.Clear();
            Basket_Click(sender, e);
        }

        protected void ImageBtn_Click(object sender, CommandEventArgs e)
        {
            int i = Int16.Parse(e.CommandArgument.ToString());
            HiddenProductID.Value = productList[i].id.ToString();
            //Label11.Text = productList[i].id.ToString();
            Label1.Text = productList[i].productName;
            Image1.ImageUrl = productList[i].imgURL;
            Label2.Text = productList[i].productDetails;
            Label3.Text = "Price: $ " + productList[i].price.ToString();

            ShopMultiView.ActiveViewIndex = 1;
        }

        protected void Options_Reset()
        {
            RadioButtonList1.SelectedIndex = 0;
            amount = 1;
            Label4.Text = amount.ToString();
        }

        protected void AddAmount_Click(object sender, EventArgs e)
        {
            if(0 < amount && amount < 99)
            {
                amount = amount + 1;
                Label4.Text = amount.ToString();
            }
            else { }
        }

        protected void ReduceAmount_Click(object sender, EventArgs e)
        {
            if (amount == 1) { }
            else {
                amount = amount - 1;
                Label4.Text = amount.ToString();
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = Int16.Parse(HiddenProductID.Value);

            if (RadioButtonList1.SelectedIndex != 0)
            {
                Image1.ImageUrl = productList[i].imgURLF;
            }
            else
            {
                Image1.ImageUrl = productList[i].imgURL;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string message = "Order Placement Successful!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

                Cancel_Click(sender, e);
            }
            else
            {
                string message = "Invalid Submission";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }
        }
    }
}