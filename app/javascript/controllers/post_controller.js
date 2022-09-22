import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['textAreas']

  toggleScrolling() {
    if (this.element.style.overflow == 'hidden') {
      this.element.style.overflow = 'auto'
    } else {
      this.element.style.overflow = 'hidden'
    }
  }

  focusComment() {
    this.textAreasTarget.focus({focusVisible: true})
  }
}
