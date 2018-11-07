using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace App.Data.EF
{
   public class FunctionCore
    {
        public static bool SetValueObjectProperty(dynamic obj, string propertyName, dynamic value)
        {
            var isValid = ((Type)obj.GetType()).GetProperties().Where(p => p.Name.Equals(propertyName)).Any();
            if (isValid)
            {
                SetObjectProperty(propertyName, value, obj);
            }
            return isValid;
        }
        private static void SetObjectProperty(string propertyName, dynamic value, object obj)
        {
            PropertyInfo propertyInfo = obj.GetType().GetProperty(propertyName);
            // make sure object has the property we are after
            if (propertyInfo != null)
            {
                propertyInfo.SetValue(obj, value, null);
            }
        }
    }
}
