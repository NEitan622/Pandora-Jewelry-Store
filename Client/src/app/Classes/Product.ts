
export class Product{
//   יש בעיה להעביר נתונים עם אותיות גדולות אנגולר מכיר רק קטנות
    constructor(public id:number,public name:string,public categoryId:number
        ,public collectionId:number,
         public price:number,public stockQuantity:number,public quantity:number=1,public sum:number,
        public lastUpdate:Date,public description:string,public collectionName:string
    ) {}
}