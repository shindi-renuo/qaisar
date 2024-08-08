import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { messages: Array }
  static targets = ["history"]

  connect() {
    console.log(this.messagesValue);
  }
}
