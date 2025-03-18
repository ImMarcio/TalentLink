// app/javascript/controllers/confirm_delete_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["modal", "overlay"]

  open(event) {
    event.preventDefault()
    this.modalTarget.classList.remove("hidden")
    this.overlayTarget.classList.remove("hidden")
  }

  close() {
    this.modalTarget.classList.add("hidden")
    this.overlayTarget.classList.add("hidden")
  }

  confirm(event) {
    // Simula o envio do formulário ao confirmar a exclusão
    this.element.submit()
  }
}
