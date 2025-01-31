import ApplicationController from "controllers/application_controller"

export default class extends ApplicationController {
  static targets = ["message", "order_id", "user_id"]

  connect () {
    super.connect()
  }

  submit(e) {
    e.preventDefault()
    console.log("submitting with stimulus/reflex instead of form")
    this.stimulate("MessageReflex#create", {
      message: this.messageTarget.value,
      user_id: this.user_idTarget.value,
      order_id: this.order_idTarget.value,
    })
    this.messageTarget.value = ""
  }
}