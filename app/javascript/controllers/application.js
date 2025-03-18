import { Application } from "@hotwired/stimulus"
import "./controllers";
import ErrorHandlerController from "controllers/error_handler_controller";


const application = Application.start()


application.register("error-handler", ErrorHandlerController);

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
