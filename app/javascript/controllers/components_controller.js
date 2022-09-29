import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="components"
export default class extends Controller {

  connect() {
  }

  deleteElement() {
    this.element.getElementsByTagName('form')[0].submit()
    this.element.remove()
  }

  decline() {
    this.form = this.element.getElementsByTagName('form')
    this.form.length > 1 ? this.form[1].submit() : this.form[0].submit()
    this.element.remove()
  }
}
