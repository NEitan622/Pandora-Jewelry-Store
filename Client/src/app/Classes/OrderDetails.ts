export class OrderDetails{
    //   יש בעיה להעביר נתונים עם אותיות גדולות אנגולר מכיר רק קטנות
        constructor(public orderId?:number,public totalSum?:number,public difference?:number
        ) {}
    }