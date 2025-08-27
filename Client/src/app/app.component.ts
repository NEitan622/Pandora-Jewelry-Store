import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ProductComponent } from "./Comps/product/product.component";
import { MenuComponent } from "./Comps/menu/menu.component";
import { StoreComponent } from "./Comps/store/store.component";
import { ButtonComponent } from "./Comps/button/button.component";
import { CartComponent } from "./Comps/cart/cart.component";
import { NavComponent } from "./Comps/nav/nav.component";

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, MenuComponent, CartComponent, NavComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'final_project'
}
