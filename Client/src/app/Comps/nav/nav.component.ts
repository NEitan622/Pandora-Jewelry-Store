import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CategoryService } from '../../Services/category.service';
import { Category } from '../../Classes/Category';

@Component({
  selector: 'app-nav',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './nav.component.html',
  styleUrl: './nav.component.css'
})
export class NavComponent {

  
  constructor(public catS:CategoryService) {

  }
  c:Array<Category>=new Array<Category>

}






