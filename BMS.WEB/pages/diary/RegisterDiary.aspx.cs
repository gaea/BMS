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
using System.Collections.Generic;
using Newtonsoft.Json;

namespace BMS.WEB.pages.diary
{
    public partial class RegisterDiary : System.Web.UI.Page
    {
        public JavaScriptSerializer serialize = new JavaScriptSerializer();
		
		protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string action = Request.Params["accion"];
                if (!string.IsNullOrEmpty(action))
                {
                    switch (action)
                    {
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "GetEntryType":
                            Response.Write("({success: true, data:" + this.GetEntryType() + "})");
                            break;
                        case "GetState":
                            Response.Write("({success: true, data:" + this.GetState() + "})");
                            break;
                        case "GetPerson":
                            Response.Write("({success: true, data:" + this.GetPerson() + "})");
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }
		
        public string Save(string DiaryProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {

                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(DiaryProperties);
                
                Diary diary = new Diary()
                {
                    Id_Functionary = Convert.ToDecimal(dicProperties["Id_Functionary"]),
                    Id_Visitor = float.Parse(dicProperties["Id_Visitor"]),
                    Description = dicProperties["Description"],
                    DateDiary = Convert.ToDateTime(dicProperties["DateDiary"]).ToString(ConfigManager.FieldsTypeDateFormat),
                    HourDiary = Convert.ToDateTime(dicProperties["HourDiary"]).ToString(ConfigManager.FieldsTypeTimeFormat),
                    Id_User = 1
                };

                if (diary.Id_Diary == null)
                {
                    diary.DateCreateRegistration = System.DateTime.Now;

                    DiariesDao.save(diary);
                }
                else
                {
                    diary.DateModifyRegistration = System.DateTime.Now;

                    DiariesDao.update(diary);
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

        public string GetEntryType()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(EntryTypesDao.findAll());
        }

        public string GetState()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(StatesDao.findAll());
        }

        public string GetPerson()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(PersonsDao.findAll());
        }
    }
}
