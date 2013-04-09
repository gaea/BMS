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

namespace BMS.WEB.cls
{
    public class DataResponse
    {
        private int total;
        private string result;

        public string Result
        {
            get { return result; }
            set { result = value; }
        }

        public int Total
        {
            get { return total; }
            set { total = value; }
        }
    }
}
