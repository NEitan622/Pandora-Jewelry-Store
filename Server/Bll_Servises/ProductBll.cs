using Dto_Common_Enteties;
using IDal_Repository;

namespace Bll_Services
{
    public class ProductBll : IBll_Services.IProductBll
    {
        IProductDal dalP;
        //יוצר מסוג הממשק לצורך מניעת התלות
        //ומממש את כל הפונקציות הנדרשות
        public ProductBll(IProductDal p)
        {
            this.dalP = p;
        }
        public async Task<List<ProductDto>> GetAll()
        {
            return await dalP.GetAll();
        }

        public async Task<ProductDto> GetById(int id)
        {
            return await dalP.GetById(id);  
        }

        public async Task<List<ProductDto>> GetFilter(short? categoty, short? collection, short? price)
        {
            return await dalP.GetFilter(categoty,collection,price);


        }
    }
}