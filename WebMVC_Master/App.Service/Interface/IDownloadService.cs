using App.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace App.Service.Interface
{
    public interface IDownloadService
    {
        Task<FileResultModel> DownloadFileAsync(string filename);
    }
}
