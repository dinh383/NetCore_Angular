using System;
using System.Collections.Generic;
using System.Text;

namespace ShoppingCore.Data.Interfaces
{
    /// <summary>
    /// Defines an interface for objects whose creation and modified dates are kept track of.
    /// </summary>
    public interface IUserTracking
    {
        string UserCreated { get; set; }
        string UserModified { get; set; }
    }
}
