using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Dto_Common_Enteties;
using IBll_Services;

namespace storeProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase

    {
        ICustomerBll c;

        public CustomerController(ICustomerBll c)
        {
            this.c = c;
        }
        [HttpPost]
        // הוספת לקוח
        //unique email לא היה צורך לבדא שלקוח זה לא קיים מכיוון שבוצעה התחברות ללקוח קיים - ומוגדר במסד 
        public async Task<int> PostAsync(CustomerDto cust)
        {
            return await c.AddAsync(cust);
        }
        //שליפה לפי מייל
        [HttpGet("{email}")]
        public async Task<CustomerDto> ByEmail(string email)
        {
            return await c.GetByEmailAsync(email);
        }

    }
}
