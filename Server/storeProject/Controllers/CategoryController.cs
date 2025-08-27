using Dto_Common_Enteties;
using IBll_Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace storeProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        ICategoryBll c;
        public CategoryController(ICategoryBll c)
        {
            this.c = c;

        }// שליפת כל הקטגוריות
        [HttpGet]
        public async Task<List<CategoryDto>> GetAllP()
        {
            return await c.GetAll();
        }
    }
}
