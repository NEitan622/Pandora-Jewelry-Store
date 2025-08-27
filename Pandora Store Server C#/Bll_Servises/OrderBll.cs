using Dto_Common_Enteties;
using IBll_Services;
using IDal_Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bll_Services
{
    public class OrderBll : IOrderBll
    {

        IOrderDal ODal;
        public OrderBll(IOrderDal o)
        {
            this.ODal = o;
        }
        public async Task<OrderTotalDto> AddAsync(OrderDto od)

        {
            OrderTotalDto total = new OrderTotalDto();
            double sum = 0;
            double difference = 0;
            foreach (ProductDto p in od.Sal)
            {
                sum += p.Sum;
            }
            var bd = od.Customer.Birthdate.Month;
            if (DateTime.Today.Month == bd)
            {
                double Tsum = sum * 0.9;
                difference = sum - Tsum;
                total = await ODal.AddAsync(od, Tsum, difference);

            }
            else { 
            total = await ODal.AddAsync(od, sum, difference);
            }
            return total;
        }

        public Task<bool> AddDetailsAsync(EndOrderDto o)
        {
            return ODal.AddDetailsAsync(o);
        }
    }
}
