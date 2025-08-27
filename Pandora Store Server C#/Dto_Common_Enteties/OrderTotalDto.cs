using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto_Common_Enteties
{
    public partial class OrderTotalDto
    {
     // אישור סופי ללקוח
        public short OrderId { get; set; }
        public double TotalSum {  get; set; }
        public double? Difference { get; set; }
    }
}
