import { Injectable } from '@angular/core';
import { Product } from '../Classes/Product';
// 
@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor() { }
  sal: Array<Product> = new Array<Product>()
  // פונקצית הוספת מוצר לסל מתבצעת כאן מכיוון ש2 קומפוננטות משתמשות בה(חנות ופרטים נוספים)
  addToSal(product: Product) {
  
    if (this.sal.includes(product)) {

      var x = this.sal.find(x => x == product)
      // !.quantity += 1;
      x!.quantity++;
      x!.stockQuantity-=x!.quantity;
      let itemIndex = this.sal.findIndex(item => item.id == x!.id);
      this.sal[itemIndex] = x!;
      
      this.sal.find(x => x == product)!.sum+=product.price;

    }
    else {
      this.sal.push(product)
      console.log("asdfghjk");
      
      this.sal.find(x => x == product)!.sum+=product.price;

    }
  }
  
}
