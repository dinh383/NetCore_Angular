using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace App.Infrastructure.Interface
{
    public interface IUnitOfWork : IDisposable
    {
        Task BeginTransaction(IsolationLevel isolationLevel = IsolationLevel.Unspecified);

        bool CommitTransaction();

        void RollbackTransaction();

        int SaveChanges();

        Task<int> SaveChangesAsync();

        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
    }
}
