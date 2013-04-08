using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Script.Serialization;

namespace BMS.WEB
{
    public partial class Login : System.Web.UI.Page
    {
        public JavaScriptSerializer serialize = new JavaScriptSerializer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string action = Request.Params["accion"];
                string user = Request.Params["user"];
                string password = Request.Params["password"];

                if (!string.IsNullOrEmpty(action))
                {
                    switch (action)
                    {
                        case "Login":
                            Response.Write("({success: true, data:{Message:\"Autenticación Exitosa\", url:\"" + this.Authenticate(user, password) + "\"}})");
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }

        public string Authenticate(string user, string password)
        {
            return "Desktop.aspx";
        }
    }
}
