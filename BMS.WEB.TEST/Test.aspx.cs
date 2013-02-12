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
using TMA.MODEL.Entity;
using TMA.DAO.EntityManager;

namespace BMS.WEB.TEST
{
    public partial class Test : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string userProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Users user = serialize.Deserialize<Users>(userProperties);
                user.IsActive = true;
                user.Id_Role = 1;
                user.DocumentType = 1;
                user.DateCreateRegistration = System.DateTime.Now;
                user.DateModifyRegistration = System.DateTime.Now;

                UsersDao.save(user);

                msg.Message = "Registro guardado exitosamente";
            }
            catch (Exception ex) 
            {
                msg.Message = ex.Message;
            }

            return serialize.Serialize(msg);
        }

        [System.Web.Services.WebMethod]
        public static string List(string start, string limit) 
        {
            return serialize.Serialize(UsersDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string TestWebMethod(string nombre) 
        {
            Users user = new Users() { Login = "agus", Id_Role = 1, Id_User = 1, Password = "aguspass" };

            return serialize.Serialize(user);//"{mensaje:" + nombre + "}";
        }


    }
}
