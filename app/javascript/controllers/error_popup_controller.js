import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["errorMessage"];

  connect() {
    // Fecha automaticamente após 5 segundos
    setTimeout(() => {
      this.closeError();
    }, 5000);
  }

  closeError() {
    this.errorMessageTarget.style.display = "none";
  }
}
