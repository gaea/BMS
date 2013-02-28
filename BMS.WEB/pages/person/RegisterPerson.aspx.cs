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
using TMA.DAO.EntityManager;
using System.Web.Script.Serialization;

namespace BMS.WEB.pages.person
{
    public partial class RegisterPerson : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string GetCompany()
        {
            return serialize.Serialize(CompaniesDao.findAll());
        }
    }
}
