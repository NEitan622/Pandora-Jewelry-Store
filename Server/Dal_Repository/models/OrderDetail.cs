using System;
using System.Collections.Generic;

namespace Dal_Repository.models;

public partial class OrderDetail
{
    public short Id { get; set; }

    public short? OrderId { get; set; }

    public short? ProductId { get; set; }

    public short Quantity { get; set; }

    public virtual Order? Order { get; set; }

    public virtual Product? Product { get; set; }
}
