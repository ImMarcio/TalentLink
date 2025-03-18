import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["errorBox"];

  connect() {
    this.autoClose();
  }

  autoClose() {
    setTimeout(() => {
      this.close();
    }, 5000);
  }

  close() {
    this.element.remove();
  }
}
