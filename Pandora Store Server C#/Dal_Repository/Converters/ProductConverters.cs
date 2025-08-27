using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal_Repository.Converters
{
    internal class ProductConverters
    {
        //לצורך שליפת מוצר לפי קוד
        // וכן כל המוצרים בפונקציה למטה
        public static Dto_Common_Enteties.ProductDto ToProductDto(models.Product product)
        {
            Dto_Common_Enteties.ProductDto pNew = new Dto_Common_Enteties.ProductDto();
            pNew.Id = product.Id;
            pNew.CategoryId = product.CategoryId;
            pNew.CollectionId = product.CollectionId;
            pNew.Description = product.Description;
            pNew.Name = product.Name;
            pNew.Price = product.Price;
            pNew.StockQuantity = product.StockQuantity;
            pNew.LastUpdate = product.LastUpdate;

            if (product.Collection != null)
                pNew.CollectionName = product.Collection.Name;
            return pNew;
        }


        public static List<Dto_Common_Enteties.ProductDto> ToListProductDto(List<models.Product> product)
        {
            List<Dto_Common_Enteties.ProductDto> lNew = new List<Dto_Common_Enteties.ProductDto>();
            foreach (models.Product product1 in product)
            {
                lNew.Add(ToProductDto(product1));
            }
            return lNew;
        }
    }
}
