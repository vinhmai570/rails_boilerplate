import '@hotwired/turbo-rails'
import { Turbo } from '@hotwired/turbo-rails'
import './controllers'
import * as bootstrap from 'bootstrap'

window.bootstrap = bootstrap

Turbo.start()
