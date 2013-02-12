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

namespace BMS.WEB.TEST
{
    public class MessageResponse
    {
        private string message;
        private string error;

        public string Message {
            get { return message; }
            set { message = value; }
        }

        public string Error
        {
            get { return error; }
            set { error = value; }
        } 
    }
}
