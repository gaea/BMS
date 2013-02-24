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
using System.IO;
using BMS.CONFIGURATION;
using BMS.WEB.cls;

namespace BMS.WEB.pages
{
    public partial class Profile : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string profileProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Profile profile = serialize.Deserialize<TMA.MODEL.Entity.Profile>(profileProperties);

                profile.DateCreateRegistration = System.DateTime.Now;

                if (profile.Id_Profile == null)
                {
                    ProfilesDao.save(profile);
                }
                else
                {
                    ProfilesDao.update(profile);
                }

                msg.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.SaveErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        [System.Web.Services.WebMethod]
        public static string List(string start, string limit)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                return serialize.Serialize(ProfilesDao.findAll());
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);

        }

        [System.Web.Services.WebMethod]
        public static string Delete(string Id_Profile)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Profile profile = ProfilesDao.find(Convert.ToInt32(Id_Profile));

                ProfilesDao.delete(profile);

                msg.Message = ConfigManager.DeleteSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }
    }
}
