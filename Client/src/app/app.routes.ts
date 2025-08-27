import { Routes } from '@angular/router';
import { StoreComponent } from './Comps/store/store.component';
import { CartComponent } from './Comps/cart/cart.component';
import { RegisterComponent } from './Comps/register/register.component';
// import { DetailesComponent } from './Comps/detailes/detailes.component';
import { PaymentComponent } from './Comps/payment/payment.component';
import { DetailesComponent } from './Comps/detailes/detailes.component';
import { HomeComponent } from './Comps/home/home.component';

export const routes: Routes = [
    { path: 'cart', component: CartComponent, title: 'סל קניות' },
    { path: 'register', component: RegisterComponent, title: ' הרשמה' },
    { path: 'products', component: StoreComponent, title: ' חנות' },
    { path: 'payment', component: PaymentComponent, title: ' תשלום' },
    { path: 'product_detailes/:pId', component: DetailesComponent, title: 'פרטים נוספים' },
    { path: 'home', component: HomeComponent, title: 'דף הבית' },
    { path: '', component: HomeComponent, title: 'דף הבית' },
];
