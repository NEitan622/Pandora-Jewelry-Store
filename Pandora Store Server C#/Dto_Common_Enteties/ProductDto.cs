using System;

namespace Dto_Common_Enteties
{
    public partial class ProductDto
    {
        public short Id { get; set; }

        public string Name { get; set; } = null!;

        public short CategoryId { get; set; }

        public short CollectionId { get; set; }

        public string? Description { get; set; }

        public short Price { get; set; }

        public short StockQuantity { get; set; }

        public DateTime LastUpdate { get; set; }


        public string CollectionName { get; set; }
        // כמות שהזמין הלקוח למוצר זה
        public short Quantity { get; set; } = 1;
        // סכום ללקוח לקניה נוכחית
        public float Sum { get; set; }

    }
}
