import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["submitbtn"]
  connect() {
    console.log("Hello from Form Reset Controller");
  }

  reset() {
    console.log("Hello from #reset");
    console.log(this.element);
    this.element.reset();
    Rails.enableElement(this.submitbtnTarget)
  }

  submit() {
    const form = event.target.form || event.target.closest("form")
    if (form) form.requestSubmit()
  }

  delete() {
    
  }
}