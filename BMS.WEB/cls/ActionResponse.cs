using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Script.Serialization;

namespace BMS.WEB.cls
{
    public class ActionResponse
    {
        private bool success;
        private MessageResponse data;

        public ActionResponse()
        {
            data = new MessageResponse();
        }

        public bool Success 
        {
            get { return success; }
            set { success = value; }
        }

        public MessageResponse Data
        {
            get { return data; }
            set { data = value; }
        }

        public string ToJsonString()
        { 
            JavaScriptSerializer serialize = new JavaScriptSerializer();

            return string.Concat("(", serialize.Serialize(this), ")");
        }
    }
}
