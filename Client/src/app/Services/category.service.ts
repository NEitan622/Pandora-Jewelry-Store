import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Category } from '../Classes/Category';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class CategoryService {
baseUrl:string='http://localhost:5097/api/Category/'
  constructor(public server:HttpClient) { }

   getAll():Observable<Array<Category>>
    {
        return this.server.get<Array<Category>>(this.baseUrl)
    }
}
