import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    new bootstrap.Toast(this.element).show()
  }
}
