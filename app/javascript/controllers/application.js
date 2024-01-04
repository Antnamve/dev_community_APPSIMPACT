import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

window.bootstrap = bootstrap;