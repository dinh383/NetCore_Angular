using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace App.Model.ViewModel
{
    public class FileResultModel
    {
        public MemoryStream File { get; set; }

        public string MimeType { get; set; }

        public string Name { get; set; }
    }
}
