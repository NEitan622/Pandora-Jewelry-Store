import { Component, OnInit } from '@angular/core';
import { ProductComponent } from "../product/product.component";
import { Product } from '../../Classes/Product';
import { ProductService } from '../../Services/Product.service';
import { MenuComponent } from "../menu/menu.component";
import { ButtonComponent } from "../button/button.component";
import { CartService } from '../../Services/cart.service';
import { Router, RouterOutlet } from '@angular/router';


@Component({
  selector: 'app-store',
  standalone: true,
  imports: [ProductComponent, MenuComponent],
  templateUrl: './store.component.html',
  styleUrl: './store.component.css'
})
export class StoreComponent implements OnInit {

  constructor(public productS: ProductService, public salS: CartService, public route: Router) {
  }
  ngOnInit(): void {
    this.getAll()
  }

  allProduct: Array<Product> = new Array<Product>()

  getAll() {
    this.productS.getProducts().subscribe(
      succsess => {
        console.log('😇🏅😇');
        // מיון עפ"י מחיר בסדר עולה
        succsess.sort((x, y) => x.price - y.price)
        this.productS.product = succsess

      },
      err => {
        console.log("error " + err.message)
      
      }
    )
    console.log("סוף הפונקציה");
  }
 
}
