import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  showPreview(event) {
    if (event.target.files.length > 0) {
      var src = URL.createObjectURL(event.target.files[0]);
      var preview = event.target.parentElement.querySelector('.edit-profile-pic')
      preview.src = src;
      preview.style.display = "block";
    }
  }

  showPreviewComment(event) {
    if (event.target.files.length > 0) {
      event.target.parentElement.querySelector('.image-container').innerHTML = '<div class="image-container"><img src="" alt="" class="image-preview"></div>'
      var src = URL.createObjectURL(event.target.files[0]);
      var previewContainer = event.target.parentElement.querySelector('.image-container')
      var preview = event.target.parentElement.querySelector('.image-preview')
      preview.src = src;
      preview.style.display = "block";
      previewContainer.innerHTML += '<a class="reset-button" data-action="edit#deleteFile"><i class="fa-solid fa-xmark close-button"></i></a>'
    }
  }

  deleteFile(event) {
    console.log(event.target)
    event.target.parentElement.parentElement.parentElement.querySelector('.inputfile').value = ''
    event.target.parentElement.parentElement.parentElement.querySelector('.image-container').innerHTML = '<div class="image-container"><img src="" alt="" class="image-preview"></div>'
  }
}
