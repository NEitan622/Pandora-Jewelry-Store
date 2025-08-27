import { Component, Input, OnInit, Output } from '@angular/core';
import { ProductService } from '../../Services/Product.service';
import { CategoryService } from '../../Services/category.service';
import { Category } from '../../Classes/Category';
import { Router } from '@angular/router';
import { ButtonComponent } from "../button/button.component";
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [ButtonComponent,FormsModule],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent implements OnInit {
  constructor(public categoryS: CategoryService,
     public productS: ProductService,public route:Router) { }

  ngOnInit(): void {
    this.getAll()
  }
  c: Array<Category> = new Array<Category>()
  price:number|undefined
  cat:Category=new Category()
  //שליפת מוצרים ראשנית מהמסד
  getAll() {
    this.categoryS.getAll().subscribe(
      succsess => {
        console.log('😇🏅😇');
       
        this.c = succsess
      },
      err => {
        console.log("error " + err.message)
   
      }
    )

  }
// סנון עפ"י הגבלת מחיר ו/ או קטגוריה בו זמנית
  filter(c?:Category) {
    if(c)
      this.cat=c
    this.productS.getFilter(this.cat.id,this.price).subscribe(
      succsess => {
        console.log('😇🏅😇');
        //מיון בלקוח עפ"י מחיר
        succsess.sort((x, y) => x.price - y.price)
        this.productS.product = succsess
      
        console.log('ממוין!');
      },
      err => {
        console.log("error " + err.message)
      
      }
    )

  }
  


}
