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

namespace BMS.WEB
{
    public partial class Desktop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getParameter("test");
        }

        /// <summary>
        /// Obtiene el valor de un parametro enviado a traves de una peticion
        /// </summary>
        /// <param name="parameter">llave del parametro</param>
        /// <returns>valor del parametro</returns>
        public string getParameter(string parameter)
        {
            return Request.Params[parameter];
        }
    }
}
