using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dal_Repository.Converters;
using Dal_Repository.models;
using Dto_Common_Enteties;
using IDal_Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;


namespace Dal_Repository
{
    public class OrderDal : IOrderDal
    {
        StoreContext db;
        public OrderDal(StoreContext db)
        {
            this.db = db;
        }
        //הוספת הזמנה
        // bll-מקבלת הזמנה ת מחיר סופי לאחר הנחה  והפרש- מחושב ב
        public async Task<OrderTotalDto> AddAsync(OrderDto o, double payment, double difference)
        {
            // ממיר את פרטי ההזמנה והתשלום  שהתקבלו לאוביקט תואם למסד
            Order order = OrderConverter.ToOrder(o, payment, difference);
            //הוספת ההזמנה למסד ושמירה
            db.Add(order);
            db.SaveChanges();
            //יצירת אוביקט לצורך שליחת קוד ההזמנה והסכום לשלום ללקוח
            OrderTotalDto orderTotalDto = new OrderTotalDto();
            orderTotalDto.TotalSum = payment;
            orderTotalDto.Difference = difference;
            //שליפת ההזמנה הנוכחית - האחרונה שנוספה למסד
            // לצורך קוד ההזמנה
            var y = (from w in db.Orders.OrderByDescending(u => u.Id)
                     select order.Id
                    ).FirstOrDefault();
            orderTotalDto.OrderId = y;
            return orderTotalDto;
        }

        // עדכון פרטי הזמנה לאחר אישור הלקוח
        //מקבלת אובייקט שמכיל את קוד ההזמנה ורשימת המוצרים- כלומר הסל של הלקוח
        // אם העדכון בוצע בהצלחה true מחזירה
        public async Task<bool> AddDetailsAsync(EndOrderDto o)
        {
            OrderDetail od = new OrderDetail();
            try
            { //דבר ראשון מעדכנת את ההזמנה במסד לשולמה
                var d = await db.Orders.FirstAsync(x => x.Id == o.Order_id);
                d.IsPay = true;
                db.Orders.Update(d);

                //עבור כל מוצר בסל
                foreach (ProductDto p in o.Sal)
                {
                    // מוסיפה שורה בטבלת פרטי הזמנה עם הפרטים
                    od.OrderId = o.Order_id;
                    od.ProductId = p.Id;
                    od.Quantity = p.Quantity;
                    db.Add(od);
                    //(מרוקנת את האוביקט למוצר הבא)
                    od = new OrderDetail();
                   // מעדכנת בטבלת המוצרים על המוצר הנוכחי- את כמותו לאחר קניה זו 
                    var pro = await db.Products.FirstAsync(x => x.Id == p.Id);
                    pro.StockQuantity -= p.Quantity;
                    //מעדכנת תאריך עדכון אחרון להיום
                    pro.LastUpdate = DateTime.Today;
                    db.Products.Update(pro);



                }
                db.SaveChanges();
                return true;
            }

            catch (Exception ex) { throw ex; }
           

        }


    }
}
