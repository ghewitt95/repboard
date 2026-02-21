import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button"]

  copy() {
    navigator.clipboard.writeText(this.sourceTarget.value)
    this.buttonTarget.textContent = "✅ Copied!"
    setTimeout(() => {
      this.buttonTarget.textContent = "Copy Link"
    }, 2000)
  }
}
