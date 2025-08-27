import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Order } from '../Classes/Order';
import { Observable } from 'rxjs';
import { OrderDetails } from '../Classes/OrderDetails';
import { EndOrder } from '../Classes/EndOrder';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  constructor(public server: HttpClient) { }
  newOrder: Order = new Order();
  Dorder: OrderDetails = new OrderDetails();

  baseUrl: string = 'http://localhost:5097/api/Order/'

  addOrder(order: Order): Observable<OrderDetails> {
    return this.server.post<OrderDetails>(this.baseUrl, order)
  }

  // סיום הזמנה 
  // הוספת פרטי ההזמנה למסד אישור סופי של הקניה
  endOrder(order: EndOrder): Observable<boolean> {
    return this.server.post<boolean>(this.baseUrl+"EndOrder", order)
  }
}
