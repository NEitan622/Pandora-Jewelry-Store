using Dto_Common_Enteties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBll_Services
{
    public interface IOrderBll
    {
        Task<OrderTotalDto> AddAsync(OrderDto od);
        Task<bool> AddDetailsAsync(EndOrderDto o);
    }
}
