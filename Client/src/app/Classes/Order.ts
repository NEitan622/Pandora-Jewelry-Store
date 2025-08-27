import { Customer } from "./Customer";
import { Product } from "./Product";

export class Order{
    //   יש בעיה להעביר נתונים עם אותיות גדולות אנגולר מכיר רק קטנות
        constructor(public customer?:Customer,public sal?:Array<Product>) {}
    }