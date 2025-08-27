using System;
using System.Collections.Generic;

namespace Dal_Repository.models;

public partial class Collection
{
    public short Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
