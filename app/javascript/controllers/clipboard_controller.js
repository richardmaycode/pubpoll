import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["source"]
  
  connect() {
    console.log("Hello from Clipboard Controller!");
  }

  copy() {
    if (document.queryCommandSupported("copy")) {
      this.sourceTarget.select();
      document.execCommand("copy");
    }
  }
}