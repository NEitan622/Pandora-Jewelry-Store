
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dto_Common_Enteties;

namespace IBll_Services
{
    public interface IProductBll : IBllService<ProductDto>
    {
        // IBllService<ProductDto>  -יורש מ
        // getAll בשביל הפונקציה 

        //הצהרות לפונקציות שימומשו ע"י מי שיירש מהממשק
        Task<List<ProductDto>> GetFilter(short? categoty, short? collection, short? price);
        Task<ProductDto> GetById(int id);
    }
}

