import { Application } from '@hotwired/stimulus'
import FlashController from './flash_controller'
import * as bootstrap from 'bootstrap'

window.bootstrap = bootstrap;
const application = Application.start()

application.register('flash', FlashController);
