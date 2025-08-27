
using Dal_Repository.Converters;
using Dal_Repository.models;
using Dto_Common_Enteties;
using Microsoft.EntityFrameworkCore;
using System;

namespace Dal_Repository
{
    public class ProductDal : IDal_Repository.IProductDal
        //שכבה זו מטפלת בשליפה מהמסד עצמו
    {
        //מניעת התלות
        StoreContext db;
        public ProductDal(StoreContext db)
        {
            this.db = db;
        }

        //שליפה ראשונית של הנתונים
        // Best Seller שולפת רק מוצרים נמכרים ביותר 
        // ומתוכם מסננת רק 21 ראשונים
        //Include- לצורך שליפת שם הקטגוריה והקולקציה מטבלאות שונות
        public async Task<List<ProductDto>> GetAll()
        {
            var q = await db.Products.Include(p => p.Category).Include(p => p.Collection).Where(p => p.Description == "Best Seller").Take(21).ToListAsync();
            return ProductConverters.ToListProductDto(q);

        }
        //שולף את הראשון שהקוד שווה לקוד המבוקש
        public async Task<ProductDto> GetById(int id)
        {
            try
            {
                var q = await db.Products.Include(p => p.Collection).FirstAsync(p => p.Id == id);

                return ProductConverters.ToProductDto(q);
            }
            catch (Exception ex) { throw ex; }

        }

        //מקבלת כאופציה 3 פרמטרים
        //יוצרת רשימה ומכניסה לתוכה את המתאימים לתנאי
        //אם יש מספר תנאים בכל שלב מסננת שוב את הרשימה לפי התנאי

        // ToListAsync שליפה חדשה נעשית ע"י 
        // ToList סינון נוסף-
        public async Task<List<ProductDto>> GetFilter(short? categoty, short? collection, short? price)
        {
            List<Product> lp = new List<Product>();
            if (categoty != null)
            {
                if (lp.Count < 1)
                    lp = await db.Products.Where(p => p.CategoryId == categoty).ToListAsync();
                else
                    lp =  lp.Where(p => p.CategoryId == categoty).ToList();
            }
            if (collection != null)
            {
                if (lp.Count < 1)
                    lp = await db.Products.Where(p => p.CollectionId == collection).ToListAsync();
                else
                    lp = lp.Where(p => p.CollectionId == collection).ToList();
            }
               
            if (price != null) {
                if (lp.Count < 1)
                    lp = await db.Products.Where(p => p.Price <= price).ToListAsync();
                else
                    lp = lp.Where(p => p.Price <= price).ToList();
            }
            return ProductConverters.ToListProductDto(lp);

        }
    }
}
