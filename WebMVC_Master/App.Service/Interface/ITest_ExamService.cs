using App.Data.Entities;
using App.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace App.Service.Interface
{
    public interface ITest_ExamService : IServiceCommon<Test_Exam>
    {
        Task<QuestionVideoModel> GetInfoExamTest(int videoLineId);

        void BulkInsert(IList<Test_Exam> entities);

        Task BulkInsertAsync(IList<Test_Exam> entities);

        Task BulkInsertOrUpdateAsync(IList<Test_Exam> entities);

        Task BulkUpdateAsync(IList<Test_Exam> entities);

        Task BulkDeleteAsync(IList<Test_Exam> entities);
    }
}
