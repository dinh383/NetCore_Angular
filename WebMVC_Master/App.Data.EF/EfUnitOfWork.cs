using App.Infrastructure.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace App.Data.EF
{
    public class EfUnitOfWork : IUnitOfWork
    {
        private readonly DbContext _context;
        protected IDbContextTransaction Transaction;

        public EfUnitOfWork(DbContext context)
        {
            _context = context;
        }
        public async Task UseTransaction(Func<Task> a, IsolationLevel isolationLevel = IsolationLevel.ReadUncommitted)
        {
            var strategy = _context.Database.CreateExecutionStrategy();
            await strategy.ExecuteAsync(async () =>
            {
                await BeginTransaction(isolationLevel);
                try
                {
                    await a.Invoke();
                    CommitTransaction();
                }
                catch (Exception)
                {
                    RollbackTransaction();
                    throw;
                }

            });
        }

        public async Task BeginTransaction(IsolationLevel isolationLevel = IsolationLevel.ReadUncommitted)
        {
            if (_context.Database.GetDbConnection().State != ConnectionState.Open)
            {
                await _context.Database.OpenConnectionAsync();
            }
            Transaction = await _context.Database.BeginTransactionAsync(isolationLevel);
        }

        public bool CommitTransaction()
        {
            Transaction.Commit();
            return true;
        }

        public void Dispose()
        {
            Transaction?.Dispose();
            _context?.Dispose();
        }

        public void RollbackTransaction()
        {
            Transaction.Rollback();
        }

        public int SaveChanges()
        {
            return _context.SaveChanges();
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public async Task<int> SaveChangesAsync(CancellationToken cancellationToken)
        {
            return await _context.SaveChangesAsync(cancellationToken);
        }
    }
}
