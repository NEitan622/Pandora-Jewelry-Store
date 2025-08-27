using System;
using System.Collections.Generic;

namespace Dal_Repository.models;

public partial class Order
{
    public short Id { get; set; }

    public short CustomerId { get; set; }

    public DateTime Date { get; set; }

    public double Payment { get; set; }

    public double? Difference { get; set; }

    public bool IsPay { get; set; }

    public virtual Customer Customer { get; set; } = null!;

    public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
