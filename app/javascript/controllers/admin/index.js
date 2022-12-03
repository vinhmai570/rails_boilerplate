import { Application } from '@hotwired/stimulus'
import DashboardController from './dashboard_controller'
import FlashMessageController from './flash_message_controller';

const application = Application.start()

application.register('home', DashboardController);
application.register('flash-message', FlashMessageController);
