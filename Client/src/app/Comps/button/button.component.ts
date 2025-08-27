import { Component, EventEmitter, Input, Output } from '@angular/core';

// כפתור משלנו בו השתמשנו בכל חלקי האתר
@Component({
  selector: 'app-button',
  standalone: true,
  imports: [],
  templateUrl: './button.component.html',
  styleUrl: './button.component.css'
})
export class ButtonComponent {
  @Input() name: string = ""
  @Input() id: number | undefined
  @Input() icon: string = ""
  @Input() type: string = ""
  @Input() dis: boolean|undefined

  @Output() sendP = new EventEmitter()
// כאשר תופעל הפונקציה בבן הבן יפעיל את הארוע
  send() {
    this.sendP.emit(this.id)
  }

}
