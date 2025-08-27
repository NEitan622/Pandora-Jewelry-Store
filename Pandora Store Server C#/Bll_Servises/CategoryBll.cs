using Dto_Common_Enteties;
using IBll_Services;
using IBll_Services.IBll_Services;
using IDal_Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bll_Services
{
    public class CategoryBll:ICategoryBll
    {
        ICategoryDal dalC;
        public CategoryBll(ICategoryDal c)
        {
            this.dalC = c;
        }
        public async Task<List<CategoryDto>> GetAll()
        {
            return await dalC.GetAll();
        }

        async Task<List<CategoryDto>> IBllService<CategoryDto>.GetAll()
        {
            return await dalC.GetAll();
        }
    }
}
