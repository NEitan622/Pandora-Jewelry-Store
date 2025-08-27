using System;
using System.Collections.Generic;

namespace Dal_Repository.models;

public partial class Customer
{
    public short Id { get; set; }

    public string Name { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    public DateOnly Birthdate { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
