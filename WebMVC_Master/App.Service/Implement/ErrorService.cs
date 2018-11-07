
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Service
{
    public interface IErrorService
    {
        //SYS_Error Create(SYS_Error error);

        void Save();
    }

    //public class ErrorService : IErrorService
    //{
    //    private IErrorRepository _errorRepository;
    //    private IUnitOfWork _unitOfWork;

    //    public ErrorService(IErrorRepository errorRepository, IUnitOfWork unitOfWork)
    //    {
    //        this._errorRepository = errorRepository;
    //        this._unitOfWork = unitOfWork;
    //    }

    //    public SYS_Error Create(SYS_Error error)
    //    {
    //        return _errorRepository.Add(error);
    //    }

    //    public void Save()
    //    {
    //        _unitOfWork.Commit();
    //    }
    //}
}
