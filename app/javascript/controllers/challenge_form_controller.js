import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['template', 'list', 'add-link']

  add_task(e) {
    e.preventDefault()
    const content = this.templateTarget.innerHTML.replace(/::index::/g, new Date().getTime())
    this.listTarget.insertAdjacentHTML('beforeend',content)
  }
}