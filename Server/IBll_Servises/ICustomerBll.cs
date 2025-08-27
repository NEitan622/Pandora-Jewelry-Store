using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dto_Common_Enteties;


namespace IBll_Services
{
    public interface ICustomerBll
    {
        Task<int> AddAsync(CustomerDto c);
        Task<CustomerDto> GetByEmailAsync(string email);
    }
}
