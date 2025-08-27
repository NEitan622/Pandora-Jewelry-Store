using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto_Common_Enteties
{
    public partial class OrderDto
    {// הזמנה נשלחת כך מאנגולר
        public CustomerDto Customer { get; set; }
        public List<ProductDto> Sal { get; set; }
    }
}
