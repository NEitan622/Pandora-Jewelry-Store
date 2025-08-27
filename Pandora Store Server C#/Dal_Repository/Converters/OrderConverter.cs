using Dal_Repository.models;
using Dto_Common_Enteties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal_Repository.Converters
{
    internal class OrderConverter
    {
        // ממיר כל מוצר עם קוד ההזמנה לאוביקט מותאם לטבלת פרטי הזמנה
        public static OrderDetail ToOrderDetails(ProductDto p,OrderTotalDto o)
        {
            OrderDetail Od = new OrderDetail();
            Od.OrderId=o.OrderId;
            Od.ProductId=p.Id;
            Od.Quantity=p.Quantity;
            return Od;
          
        }
        //לצורך הוספת הזמנה יוצר אוביקט הזמנה מפרטי ההזמנה שהתקבלו + התשלום שחושב
        public static Order ToOrder(OrderDto oDto,double payment,double difference)
        {
            Order order = new Order();
            order.CustomerId=oDto.Customer.Id;
            order.Date =  DateTime.Today;
            order.IsPay=false;
            order.Payment = payment;
            order.Difference= difference;  
          

            return order;   
        }
        

    }
}
