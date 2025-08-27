import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Customer } from '../Classes/Customer';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {
baseUrl:string='http://localhost:5097/api/Customer/'

  constructor(public server:HttpClient) {}


  currentUser:Customer=new Customer();
  connect:boolean=false;
  
    getByEmail( email:string):Observable<Customer>
     {
         return this.server.get<Customer>(this.baseUrl+email)
     }
     addUser(customer:Customer):Observable<boolean>
     {
         return this.server.post<boolean>(this.baseUrl,customer)
     }
}
