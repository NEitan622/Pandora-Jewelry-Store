import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProductService } from '../../Services/Product.service';
import { CurrencyPipe } from '@angular/common';
import { ButtonComponent } from "../button/button.component";
import { CartService } from '../../Services/cart.service';

import { Product } from '../../Classes/Product';

@Component({
  selector: 'app-detailes',
  standalone: true,
  imports: [CurrencyPipe, ButtonComponent],
  templateUrl: './detailes.component.html',
  styleUrl: './detailes.component.css'
})
export class DetailesComponent {
 // תפיסת הפרמטר שנשלח 
constructor(public ps: ProductService,public ar: ActivatedRoute,public salS: CartService, public route: Router) {

  ar.params.subscribe(
    x => {
      this.id = x['pId'];
      //חיפוש המוצר עי הקוד
      // let p = ps.product.find(a => a.id == this.id)
      // if (p)
      //   ps.currentP = p
    }
  )
  this.getById()
}
currentP:Product=new Product(1,"a",1,1,15,1,1,1,new Date('01-05-2025'),"nn"," ")
//מפיעלה את הפונקציה בסרויס- שולפת את המוצר
getById(){
  this.ps.getById(this.id).subscribe(
    success=>{
      this.currentP=success
      console.log(this.currentP);
      
    }
  )
}
id: number = 0

d:Date=new Date()
//הוספה לסל
  sal() {

   this.salS.addToSal(this.currentP)

   
  }
}

