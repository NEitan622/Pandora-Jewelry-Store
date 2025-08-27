import { Component, OnInit } from '@angular/core';
import {  Router, RouterOutlet } from '@angular/router';
import { CustomerService } from '../../Services/customer.service';
import { CartService } from '../../Services/cart.service';
import { Order } from '../../Classes/Order';
import { OrderService } from '../../Services/order.service';
import { ButtonComponent } from "../button/button.component";
import { CurrencyPipe } from '@angular/common';
import { EndOrder } from '../../Classes/EndOrder';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-payment',
  standalone: true,
  imports: [ButtonComponent,CurrencyPipe],
  templateUrl: './payment.component.html',
  styleUrl: './payment.component.css'
})
export class PaymentComponent implements OnInit{

constructor(public customerS:CustomerService,public route:Router,public orderS:OrderService,public salS:CartService){}
// בדיקה האם לקוח מחובר  
ngOnInit(): void {
    if(this.customerS.currentUser.name==null){
      this.customerS.connect=true
      this.route.navigate([`./register`])
    }
   this.orderS.newOrder.sal=this.salS.sal
  // הוספת הקניה למסד ללא אישור קניה סופי
   this.orderS.addOrder(this.orderS.newOrder).subscribe(
    success => { 
      this.orderS.Dorder=success
      this.pay=this.orderS.Dorder.totalSum!+this.orderS.Dorder.difference!;
      
    },
    err => { Swal.fire({
      title: "אינך רשום במערכת...   ",
      text:"הינך מועבר להרשמה",
      icon: "info"
    }); 
    this.customerS.connect=false

  }
  )
  
  }
  pay:number=0;
  endO:EndOrder=new EndOrder();
  // עדכון נתונים של מור וקניה במסד
  updateD(){
   this.endO.order_id=this.orderS.Dorder.orderId
   this.endO.sal=this.salS.sal
   this.orderS.endOrder(this.endO).subscribe(
    () => {
      Swal.fire({
        title: "הקניה בוצעה בהצלחה!",
        text: "בקניה זו חסכת "+this.orderS.Dorder.difference+' ש"ח ',
        icon: "success"
      });
      this.route.navigate([`./home`])
    },
    err => { alert("error " + err.message) }
   )
  }
  }
  