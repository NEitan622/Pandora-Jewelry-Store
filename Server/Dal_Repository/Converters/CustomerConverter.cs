using Dal_Repository.models;
using Dto_Common_Enteties;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal_Repository.Converters
{
    internal class CustomerConverter
    {
        public static CustomerDto ToCustomerDto(Customer cust)
        {
            CustomerDto newC = new CustomerDto();

            newC.Id = cust.Id;
            newC.Name = cust.Name;
            newC.Phone = cust.Phone;
            newC.Birthdate = cust.Birthdate;
            newC.Email = cust.Email;

            return newC;
        }

        public static Customer ToCustomer(CustomerDto cust)
        {
            Customer newC = new Customer();
            
            newC.Name = cust.Name;
            newC.Phone = cust.Phone;
            newC.Birthdate = cust.Birthdate;
            newC.Email = cust.Email;

            return newC;
        }

        public static List<CustomerDto> ToListCustomerDto(List<Customer> customers)
        {
            List<CustomerDto> lNew = new List<CustomerDto>();
            foreach (Customer c in customers)
            {
                lNew.Add(ToCustomerDto(c));
            }
            return lNew;
        }

      
    }
}
