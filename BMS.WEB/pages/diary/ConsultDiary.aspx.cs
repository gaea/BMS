﻿using System;
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

namespace BMS.WEB.pages.diary
{
    public partial class ConsultDiary : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string DiaryProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Diary diary = serialize.Deserialize<Diary>(DiaryProperties);
                
                diary.DateCreateRegistration = System.DateTime.Now;
                diary.DateModifyRegistration = System.DateTime.Now;
                diary.Id_User = 1;
                diary.HourCreateTransaction = System.DateTime.Now.ToString();

                if(diary.Id_Visitor == null)
                {
                    TMA.MODEL.Entity.Person person = new TMA.MODEL.Entity.Person();
                    person.Name = "";
                }

                diary.State = "State";

                if (diary.Id_Diary == null)
                {
                    DiarysDao.save(diary);
                }
                else
                {
                    DiarysDao.update(diary);
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
        public static string GetEntryType() {
            return serialize.Serialize(EntryTypeDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetState()
        {
            return serialize.Serialize(StateDao.findAll());
        }
    }
}