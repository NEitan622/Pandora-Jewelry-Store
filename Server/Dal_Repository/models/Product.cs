using System;
using System.Collections.Generic;

namespace Dal_Repository.models;

public partial class Product
{
    public short Id { get; set; }

    public string? Name { get; set; }

    public short CategoryId { get; set; }

    public short CollectionId { get; set; }

    public string? Description { get; set; }

    public short Price { get; set; }

    public short StockQuantity { get; set; }

    public DateTime LastUpdate { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Collection Collection { get; set; } = null!;

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
