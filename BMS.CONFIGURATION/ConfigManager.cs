using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace BMS.CONFIGURATION
{
    public class ConfigManager
    {
        #region Attributes

        #endregion Attributes

        #region Properties

        public static string HibernateConfigPath
        {
            get
            {
                return getKey("HibernateConfigPath");
            } 
        }

        /// <summary>
        /// Obtiene el formato para los campos tipo horas
        /// </summary>
        public static string FieldsTypeTimeFormat
        {
            get
            {
                return getKey("FieldsTypeTimeFormat");
            }
        }

        /// <summary>
        /// Obtiene el path donde se alojaran las imagenes
        /// </summary>
        public static string ImagePath
        {
            get
            {
                return getKey("ImagePath");
            }
        }

        /// <summary>
        /// Obtiene el formato para los campos tipo fecha
        /// </summary>
        public static string FieldsTypeDateFormat
        {
            get
            {
                return getKey("FieldsTypeDateFormat");
            }
        }

        /// <summary>
        /// Obtiene el formato para los campos tipo fecha/hora
        /// </summary>
        public string FieldsTypeDateTimeFormat
        {
            get
            {
                return getKey("FieldsTypeDateTimeFormat");
            }
        }

        /// <summary>
        /// Obtiene el formato para los campos numéricos
        /// </summary>
        public static string FieldsTypeDecimalFormat
        {
            get
            {
                return getKey("FieldsTypeDecimalFormat");
            }
        }

        /// <summary>
        /// Mensaje para la confirmación de inserción en BD de manera satisfactoria
        /// </summary>
        public static string SaveSuccessMessage
        {
            get
            {
                return getKey("SaveSuccessMessage");
            }
        }

        /// <summary>
        /// Mensaje para la confirmación error en proceso de inserción en BD
        /// </summary>
        public static string SaveErrorMessage
        {
            get
            {
                return getKey("SaveErrorMessage");
            }
        }

        /// <summary>
        /// Mensaje para la confirmación error en proceso de consulta de registros en BD
        /// </summary>
        public static string ListErrorMessage
        {
            get
            {
                return getKey("ListErrorMessage");
            }
        }

        /// <summary>
        /// Mensaje para la confirmación de eliminación en BD de manera satisfactoria
        /// </summary>
        public static string DeleteSuccessMessage
        {
            get
            {
                return getKey("DeleteSuccessMessage");
            }
        }

        /// <summary>
        /// Mensaje para la confirmación error en proceso de eliminación de BD
        /// </summary>
        public static string DeleteErrorMessage
        {
            get
            {
                return getKey("DeleteErrorMessage");
            }
        }

        /// <summary>
        /// Bandera que indica si se requiere o no log de errores
        /// </summary>
        public static string LogRequired
        {
            get
            {
                return getKey("LogRequired");
            }
        }

        /// <summary>
        /// Ruta para el log de errores
        /// </summary>
        public static string LogPath
        {
            get
            {
                return getKey("LogPath");
            }
        }

        /// <summary>
        /// Tiempo de espera para petición
        /// </summary>
        public static string TimeForResponseRequest
        {
            get
            {
                return getKey("TimeForResponseRequest");
            }
        }

        #region Service
        
        /// <summary>
        /// Descripción del servcio de windows
        /// </summary>
        public static string ServiceDescription
        {
            get
            {
                return getKey("ServiceDescription");
            }
        }

        /// <summary>
        /// Nombre a desplegar del servcio de windows
        /// </summary>
        public static string ServiceDisplayName
        {
            get
            {
                return getKey("ServiceDisplayName");
            }
        }

        /// <summary>
        /// Nombre del servcio de windows
        /// </summary>
        public static string ServiceName
        {
            get
            {
                return getKey("ServiceName");
            }
        }

        /// <summary>
        /// Dirección IP del dispositivo biométrico
        /// </summary>
        public static string ServiceBiometricIPDevice
        {
            get
            {
                return getKey("ServiceBiometricIPDevice");
            }
        }

        /// <summary>
        /// Puerto del dispositivo biométrico
        /// </summary>
        public static string ServiceBiometricPortDevice
        {
            get
            {
                return getKey("ServiceBiometricPortDevice");
            }
        }
        #endregion


        #endregion Properties

        #region Methods

        private static string getKey(string key)
        {
            try
            {
                return ConfigurationManager.AppSettings[key];
            }
            catch (Exception exc)
            {
                throw new Exception("La llave o el archivo de configuración es inválido, por favor realice la verificación respectiva");
            }
        }
        #endregion Methods
    }
}
