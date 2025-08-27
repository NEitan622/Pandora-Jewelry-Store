using Dto_Common_Enteties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace IDal_Repository
{
    public interface IOrderDal
    {
        public Task<OrderTotalDto> AddAsync(OrderDto o,double payment,double difference);
        //מעדכנת הזמנה ל שולם
        // לפרטי ההזמנה addמוסיפה
        // מעדכנת כמות במלאי של
        // product
        // מעכנת תאריך
        public Task<bool> AddDetailsAsync(EndOrderDto o);
    }
}
