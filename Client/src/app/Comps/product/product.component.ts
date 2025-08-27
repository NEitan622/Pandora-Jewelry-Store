import { Component, Input, OnInit } from '@angular/core';
import { ProductService } from '../../Services/Product.service';
import { Product } from '../../Classes/Product';
import { CurrencyPipe, Location, NgClass } from '@angular/common';
import { CartService } from '../../Services/cart.service';
import { ButtonComponent } from "../button/button.component";
import { Router } from '@angular/router';
import { BoughtProductDirective } from '../../Directives/bought-product.directive';
import { NgModel } from '@angular/forms';

@Component({
  selector: 'app-product',
  standalone: true,
  imports: [CurrencyPipe, ButtonComponent,BoughtProductDirective,NgClass],
  templateUrl: './product.component.html',
  styleUrl: './product.component.css'
})
export class ProductComponent {

  constructor(public salS: CartService, public route: Router
    , public l:Location
  ) {

  }

// משתנים שמקבל מוצר מקומפוננטת חנות- האב
  @Input() id!: number
  @Input() img: string = ""
  @Input() name!: string
  @Input() price!: number
  @Input() product!: Product
  @Input() stock!: number
  @Input() pic!: string
  // @Output() sendToF=new EventEmitter()
//  d:Date=new Date(Date.now())
  sal(product: Product) {
   this.salS.addToSal(product)
  }
  more(p: Product) {

    this.route.navigate([`./product_detailes/${p.id}`])

  }

}
