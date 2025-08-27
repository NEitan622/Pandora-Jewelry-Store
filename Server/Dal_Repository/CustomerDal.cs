using Dal_Repository.models;
using Dto_Common_Enteties;
using Dal_Repository.Converters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal_Repository
{
    public class CustomerDal:IDal_Repository.ICustomerDal
    {
        StoreContext db;
        public CustomerDal(StoreContext db)
        {
            this.db = db;
        }
        //register
        public async Task<int> AddAsync(CustomerDto c)
        {
          //המרת האוביקט לתואם המסד והוספתו
            db.Customers.Add(CustomerConverter.ToCustomer(c));
            int x = await db.SaveChangesAsync();
            return x;
           
        }
        //שליפת לקוח לפי מייל
        //currentUser השתמשנו בפונקציה זו בהתחברות- אם חזר אוביקט- הלקוח רשום ונשמר ב
        // אם לא- בוצעה הרשמה
        public async Task<CustomerDto> GetByEmailAsync(string email)
        {
            try
            {
                var q = await db.Customers.FirstAsync(x => x.Email == email);

                return CustomerConverter.ToCustomerDto(q);
            }
            catch (Exception ex) { throw ex; }

        }
    }
}
