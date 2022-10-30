import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  showPreview(event) {
    if (event.target.files.length > 0) {
      var src = URL.createObjectURL(event.target.files[0]);
      var preview = document.getElementById("user-profile-pic");
      preview.src = src;
      preview.style.display = "block";
    }
  }

  showPreviewBg(event) {
    if (event.target.files.length > 0) {
      var src = URL.createObjectURL(event.target.files[0]);
      var preview = document.getElementById("user-background-pic");
      preview.src = src;
      preview.style.display = "block";
    }
  }
}
