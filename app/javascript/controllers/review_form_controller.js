import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["stars", "body", "error"]

  submit(event) {
    const stars = parseInt(this.starsTarget.value)
    const body = this.bodyTarget.value.trim()
    const errors = []

    if (!stars || stars < 1) {
      errors.push("Please select a star rating.")
    }

    if (!body) {
      errors.push("Please write a review.")
    }

    if (errors.length > 0) {
      event.preventDefault()
      this.errorTarget.innerHTML = errors.join("<br>")
      this.errorTarget.classList.remove("d-none")
    }
  }
}
