# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus-textarea-autogrow" # @4.0.0
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.1.0/dist/stimulus.js"
pin "stimulus-carousel", to: "https://ga.jspm.io/npm:stimulus-carousel@4.0.0/dist/stimulus-carousel.es.js"
pin "dom7", to: "https://ga.jspm.io/npm:dom7@4.0.4/dom7.esm.js"
pin "ssr-window", to: "https://ga.jspm.io/npm:ssr-window@4.0.2/ssr-window.esm.js"
pin "swiper/bundle", to: "https://ga.jspm.io/npm:swiper@7.4.1/swiper-bundle.esm.js"
