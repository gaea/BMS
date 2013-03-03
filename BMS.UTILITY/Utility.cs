using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMS.UTILITY
{
    public class Utility
    {
        public Utility() { }

        public string getValueFromDictionary(string key, Dictionary<string, string> dictionary){
            
            string value = string.Empty;

            dictionary.TryGetValue(key, out value);

            return value;
        }
    }
}
