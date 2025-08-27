import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../Classes/Product';

// כאן עושים קריאות שרת!
@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(public server: HttpClient) {
  }
  baseUrl: string = 'http://localhost:5097/api/Product/'
  product: Array<Product> = new Array<Product>()

  getFilter(category?: number,  price?: number): Observable<Array<Product>> {
    if (price == undefined)
      return this.server.get<Array<Product>>(`${this.baseUrl}ByCategoryCollectionPrice?category=${category}`)
    if (category == undefined)
      return this.server.get<Array<Product>>(`${this.baseUrl}ByCategoryCollectionPrice?price=${price}`)

    return this.server.get<Array<Product>>(`${this.baseUrl}ByCategoryCollectionPrice?category=${category}&price=${price}`)
  }

  getProducts(): Observable<Array<Product>> {
    return this.server.get<Array<Product>>(this.baseUrl)
  }
  getById(id:number): Observable<Product> {
    return this.server.get<Product>(this.baseUrl+id)
  }

}
