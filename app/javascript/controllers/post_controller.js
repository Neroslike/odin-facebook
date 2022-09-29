import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['textAreas', 'modal', 'likeModal']

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

  toggleBodyScrolling() {
    this.body = document.body
    if (this.body.style.overflow == 'hidden') {
      this.body.style.overflow = 'auto'
    } else {
      this.body.style.overflow = 'hidden'
    }
  }

  hideModal() {
    this.modalTarget.remove()
    this.toggleBodyScrolling()
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e) {
    if (e && this.likeModalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}
