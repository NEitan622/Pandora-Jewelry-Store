using Dto_Common_Enteties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDal_Repository
{
    public interface IProductDal : IDalRepository<ProductDto>
    {   //IDalRepository יורש כנ"ל את
        public Task<ProductDto> GetById(int id);
        public Task<List<ProductDto>> GetFilter(short? categoty, short? collection, short? price);
    }
}
