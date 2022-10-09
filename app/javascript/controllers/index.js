import { Application } from "@hotwired/stimulus"
import HomeController from "./home_controller"
import * as bootstrap from "bootstrap"

window.bootstrap = bootstrap;
const application = Application.start()

application.register("home", HomeController);
