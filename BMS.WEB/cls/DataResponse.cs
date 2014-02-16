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
using System.Collections.Generic;
using System.Web.Script.Serialization;

namespace BMS.WEB.cls
{
    public class DataResponse<T>
    {
        private int total;
        private List<T> result;

        public List<T> Result
        {
            get { return result; }
            set { result = value; }
        }

        public int Total
        {
            get { return total; }
            set { total = value; }
        }

        public string ToJsonString()
        {
            JavaScriptSerializer serialize = new JavaScriptSerializer();

            return string.Concat("(", serialize.Serialize(this), ")");
        }
    }
}
