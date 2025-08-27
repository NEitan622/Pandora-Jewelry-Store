import { Directive, ElementRef, HostListener } from '@angular/core';

@Directive({
  selector: '[appBoughtProduct]',
  standalone: true
})
export class BoughtProductDirective {

  constructor(private el:ElementRef) { }
  @HostListener('click') onclick(){
  this.bought('pink')
  }
  private bought(color:string){
    this.el.nativeElement.style.backgroundColor=color
  }
}

