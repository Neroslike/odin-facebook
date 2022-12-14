// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import TextareaAutogrow from 'stimulus-textarea-autogrow'
import Carousel from "stimulus-carousel"

// Stimulus textarea autogrow component
application.register('textarea-autogrow', TextareaAutogrow)
application.register("carousel", Carousel)

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

