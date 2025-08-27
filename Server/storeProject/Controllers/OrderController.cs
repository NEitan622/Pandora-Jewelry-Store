using Dto_Common_Enteties;
using IBll_Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace storeProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        IOrderBll ob;

        public OrderController(IOrderBll ob)
        {
            this.ob = ob;
        }
        //הוספת הזמנה
        [HttpPost]
        public async Task<OrderTotalDto> AddAsync(OrderDto order)
        {
            OrderTotalDto orderTotalDto = new OrderTotalDto();
            orderTotalDto= await ob.AddAsync(order);
            return orderTotalDto;
        }
        // הוספת פרטי הזמנה ועדכון סופי במסד של מלאי ותאריך
        [HttpPost("EndOrder")]
        public async Task<bool> EndOrderAsync(EndOrderDto endorder)
        {
            return await ob.AddDetailsAsync(endorder);
        }
    }
}
