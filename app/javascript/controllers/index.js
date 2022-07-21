import { Application } from "@hotwired/stimulus"
import HomeController from "./home_controller"

const application = Application.start()

application.register("home", HomeController);
