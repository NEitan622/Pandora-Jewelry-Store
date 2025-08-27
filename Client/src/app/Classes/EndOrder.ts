import { Product } from "./Product";

export class EndOrder{
    //   יש בעיה להעביר נתונים עם אותיות גדולות אנגולר מכיר רק קטנות
        constructor(public order_id?:number,public sal?:Array<Product>) {}
    }