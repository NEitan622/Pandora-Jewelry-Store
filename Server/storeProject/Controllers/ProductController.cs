
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using Dto_Common_Enteties;
using IBll_Services;

namespace storeProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {  //iproductbll יצירת מופע של אינטרפייס 
        IProductBll p;
        public ProductController(IProductBll p)
        {
            this.p = p;

        }
        //שליפת כל המוצרים
        [HttpGet]
        public async Task<List<ProductDto>> GetAllP()
        {
            return await p.GetAll();
        }
        //שליפת לפי ת.ז. של  מוצר
        [HttpGet("{id}")]
        public async Task<ProductDto> ById(int id)
        {
            return await p.GetById(id);
        }
        //שליפה לפי קטגוריה ו או קולקציה ו או מחיר query string סינון ע"י 
        [HttpGet("ByCategoryCollectionPrice")]
        public async Task<List<ProductDto>> ByCategoryCollectionPrice(short? category, short? collection, short? price)
        {
            return await p.GetFilter(category,collection,price);
        }

    }
}
