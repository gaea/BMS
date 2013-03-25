using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Topshelf;
using BMS.CONFIGURATION;

namespace BMS.SERVICE
{
    public class Class1
    {
        public static void Main(string[] args)
        {
            loadService();
        }

        public static void loadService() {
            HostFactory.Run(x =>                                 //1
            {
                //x.Service<TopShelfImplementation>(s =>                        //2
                //{
                //    s.ConstructUsing(name => new TopShelfImplementation());     //3
                //    s.WhenStarted(tc => tc.Start());              //4
                //    s.WhenStopped(tc => tc.Stop());               //5
                //});
                x.RunAsLocalSystem();                            //6

                x.SetDescription(ConfigManager.ServiceDescription);        //7
                x.SetDisplayName(ConfigManager.ServiceDisplayName );                       //8
                x.SetServiceName(ConfigManager.ServiceName);                       //9
            }); 
        }

    }

    public class TopShelfImplementation{
        public TopShelfImplementation(){}
    }
}
