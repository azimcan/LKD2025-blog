import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "counter"]
  static values = {
    maxLength: Number
  }

  connect() {
    this.updateCounter()
  }

  updateCounter() {
    const currentLength = this.inputTarget.value.length
    this.counterTarget.textContent = `${currentLength}/${this.maxLengthValue} karakter`

    if (currentLength > this.maxLengthValue) {
      this.counterTarget.classList.add("text-red-500")
    } else {
      this.counterTarget.classList.remove("text-red-500")
    }
  }
}