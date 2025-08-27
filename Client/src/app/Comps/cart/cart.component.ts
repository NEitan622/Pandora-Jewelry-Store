import { Component, OnInit } from '@angular/core';
import { CartService } from '../../Services/cart.service';
import { Product } from '../../Classes/Product';
import { ButtonComponent } from "../button/button.component";
import { CurrencyPipe } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { Router } from '@angular/router';
@Component({
  selector: 'app-cart',
  standalone: true,
  imports: [ButtonComponent, CurrencyPipe, FormsModule],
  templateUrl: './cart.component.html',
  styleUrl: './cart.component.css'
})
export class CartComponent {
  // qentity:number=0
  // detail:ProDetails=new ProDetails();
  constructor(public salS: CartService, public route: Router) {
  }
  // הוספה/הורדת כמות ממוצר מסוים בסל מטפל במחיקת המוצר ב0
  plus(p: Product) {

    console.log(p);

    if (p.quantity < p.stockQuantity) {
      p.quantity++
      p.sum = p.price * p.quantity
      p.stockQuantity--
      let itemIndex = this.salS.sal.findIndex(item => item.id == p.id);
      this.salS.sal[itemIndex] = p;
    }
    console.log(p.quantity);

  }
  minus(p: Product) {
    console.log(p);
    if (p.quantity > 0) {
      p.quantity--
      p.stockQuantity++
      p.sum = p.price * p.quantity
      let itemIndex = this.salS.sal.findIndex(item => item.id == p.id);
      this.salS.sal[itemIndex] = p;
      console.log(p.quantity);
    }
    if (p.quantity == 0) {
    
      this.del(p)

    }
  }
  //מחיקת מוצר מסל הקניות
  del(p: Product) {
    let x = this.salS.sal.findIndex(p => p.id)
    this.salS.sal.splice(x, x + 1)
  }
  //מעבר לתשלום/לחנות
  pay() {
    this.route.navigate([`./payment`])
  }
  store(){
    this.route.navigate([`./products`])
  }
}
