import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['showModal']

  show_modal() {
    this.showModalTarget.style.display = 'block'
  }
}
