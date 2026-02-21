import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["star", "input"]

  highlight(event) {
    const value = event.currentTarget.dataset.value
    this.starTargets.forEach(star => {
      star.classList.toggle("selected", star.dataset.value <= value)
    })
  }
  select(event) {
    const value = event.currentTarget.dataset.value
    this.inputTarget.value = value
    this.starTargets.forEach(star => {
      star.classList.toggle("selected", star.dataset.value <= value)
    })
  }
  reset() {
    const current = this.inputTarget.value
    this.starTargets.forEach(star => {
      star.classList.toggle("selected", star.dataset.value <= current)
    })
  }
}
