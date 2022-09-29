import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ['textArea']

  connect() {
    // const tx = document.getElementsByTagName("textarea")
    const tx = this.textAreaTargets
    for (let i = 0; i < tx.length; i++) {
      tx[i].setAttribute("style", "height:" + (tx[i].scrollHeight) + "px;overflow-y:hidden;");
      tx[i].addEventListener("input", OnInput, false);
    }

    function OnInput() {
      this.style.height = 0;
      this.style.height = (this.scrollHeight) + "px";
    }
  }

  submit(e) {
    if(e.keyCode == 13 && !e.shiftKey) {
      this.submitAndCleanup(e)
    }
  }

  submitAndCleanup(e) {
    e.preventDefault()
    this.element.submit();
    this.textAreaTarget.value = ''
  }

  focusReply(e) {
    this.frame = e.target.getElementsByTagName('textarea')[0]
    this.frame.focus()
  }
}

