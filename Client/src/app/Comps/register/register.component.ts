
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ButtonComponent } from "../button/button.component";
import { Customer } from '../../Classes/Customer';
import { CustomerService } from '../../Services/customer.service';
import { Router } from '@angular/router';
import { OrderService } from '../../Services/order.service';
import { Location } from '@angular/common';
import Swal from 'sweetalert2'

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [FormsModule, ButtonComponent],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {

  constructor(public cs: CustomerService, public route: Router, public orderS: OrderService, public loc: Location) {

  }
  customer: Customer = new Customer()
  ec: string = ""
  toRegister: boolean = true
  save() {

    this.cs.addUser(this.customer).subscribe(
      () => {

        this.cs.currentUser = this.customer
        this.orderS.newOrder.customer = this.customer
        Swal.fire({
          title: "נרשמת בהצלחה",
          icon: "success"
        });
        if (this.cs.connect == true) {
          this.route.navigate([`./payment`])
        }
        else
          this.route.navigate(['./products'])
      },
      err => {
        Swal.fire({
          title: "הינך רשום במערכת... ",
          text: "הינך מועבר להתחברות",
          icon: "error"
        });
        this.toRegister = true
      }
    )
  }
  connect() {
    this.cs.getByEmail(this.ec).subscribe(
      success => {
        this.cs.currentUser = success
        this.orderS.newOrder.customer = success
        Swal.fire({
          title: "התחברת בהצלחה",
          icon: "success"
        });
        console.log(this.cs.currentUser);
        if (this.cs.connect == false) {
          this.route.navigate([`./payment`])
        }
        else {
          this.route.navigate(['./products'])
        }
      },
      () => {
        Swal.fire({
          title: "אינך רשום במערכת...   ",
          text: "הינך מועבר להרשמה",
          icon: "info"
        });
        this.toRegister = false

      }
    )
  }
  //מחזיר את הלקוח למקום ממנו הגיע להרשמה
  back() {
    this.loc.back()
  }
}