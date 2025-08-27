using Dal_Repository.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDal_Repository;
using Dto_Common_Enteties;
using Microsoft.EntityFrameworkCore;

namespace Dal_Repository
{
    public class CategoryDal:ICategoryDal
    {
        StoreContext db;
        public CategoryDal(StoreContext db)
        {
            this.db = db;
        }
       // שליפת הקטגוריות - לצורך הצגת סינון לפי קטגוריה
        public async Task<List<CategoryDto>> GetAll()
        {
            var q = await db.Categories.ToListAsync();
            return Converters.CategoryConverter.ToListCategoryDto(q);
        }
    }
}
