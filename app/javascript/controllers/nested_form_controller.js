import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["target", "template"]
  static values = {
    wrapperSelector: String
  }
  initialize () {
    this.wrapperSelector = this.wrapperSelectorValue || '.nested-form-wrapper'
  }
  
  connect() {
    console.log("Hello from Nested Form Controller!");
  }

  add (e) {
    console.log("Add() called from Nested Form Controller");
    e.preventDefault()

    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.targetTarget.insertAdjacentHTML('beforebegin', content)
    
  }

  remove (e) {
    console.log("Remove() called from Nested Form Controller!")

    const wrapper = e.target.closest(this.wrapperSelector)

    if (wrapper.dataset.newRecord === 'true') {
      wrapper.remove()
    } else {
      wrapper.style.display = 'none'
      wrapper.querySelector("input[name*='_destroy']").value = 1
    }
  }
}