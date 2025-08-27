using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dto_Common_Enteties;
using IBll_Services;
using IDal_Repository;


namespace Bll_Services
{
    public class CustomerBll : ICustomerBll

    {

         ICustomerDal  dalC;
        public CustomerBll(ICustomerDal c)
        {
            this.dalC = c;
        }
        public async Task<int> AddAsync(CustomerDto c)
        {
            return await dalC.AddAsync(c);
        }

        public async Task<CustomerDto> GetByEmailAsync(string email)
        {
            return await dalC.GetByEmailAsync(email);
        }
    }
}
