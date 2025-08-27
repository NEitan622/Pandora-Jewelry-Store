using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dto_Common_Enteties;

namespace Dal_Repository.Converters
{
    internal class CategoryConverter
    {
        //לצןרך הצגת הקטגוריות באנגולר
        public static CategoryDto ToCategoryDto(models.Category category)
        {
            CategoryDto cNew = new CategoryDto();
            cNew.Id = category.Id;
           
            cNew.Name = category.Name;
           
            return cNew;
        }


        public static List<CategoryDto> ToListCategoryDto(List<models.Category> category)
        {
            List<CategoryDto> lNew = new List<CategoryDto>();
            foreach (models.Category c in category)
            {
                lNew.Add(ToCategoryDto(c));
            }
            return lNew;
        }
    }
}
