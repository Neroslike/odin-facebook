import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit"
export default class extends Controller {
  static targets = ['files']

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
    event.target.parentElement.parentElement.parentElement.querySelector('.inputfile').value = ''
    event.target.parentElement.parentElement.parentElement.querySelector('.image-container').innerHTML = '<div class="image-container"><img src="" alt="" class="image-preview"></div>'
  }

  showPreviewPost(event) {
    if (event.target.files.length > 0) {
      var preview = this.createPreviews(Array.from(event.target.files))
      this.filesTarget.innerHTML += preview
    }
  }

  createPreviews(files){
    var preview = ''

    files.forEach(file => {
      var container = document.createElement('div')
      container.classList.add('post-preview-container')
      var src = URL.createObjectURL(file)
      var imgTag = document.createElement('img')
      imgTag.src = src
      imgTag.style.display = 'block'
      container.innerHTML += imgTag.outerHTML
      preview += container.outerHTML
    });
    return preview
  }
}
