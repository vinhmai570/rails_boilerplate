import { Application } from '@hotwired/stimulus'
import HomeController from './home_controller'
import FlashMessageController from './flash_message_controller';

const application = Application.start()

application.register('home', HomeController);
application.register('flash-message', FlashMessageController);
