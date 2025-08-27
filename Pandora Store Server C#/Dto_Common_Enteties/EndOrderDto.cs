using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto_Common_Enteties
{
    public partial class EndOrderDto
    { //לצורך הוספת פרטי ההזמנה
        public short Order_id { get; set; }
        public List<ProductDto> Sal { get; set; }
    }
}
