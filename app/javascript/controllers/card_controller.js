import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"

// Connects to data-controller="card"
export default class extends Controller {
  static values = {
    id: Number
  }

  connect() {
  }

  dragStart(event) {
    event.dataTransfer.setData("text/plain", this.idValue)
  }

  dragOver(event) {
    event.preventDefault()
  }

  async drop(event) {
    event.preventDefault()

    const draggedCardId = Number(event.dataTransfer.getData("text/plain"))
    const draggedCard = document.querySelector(`[data-card-id-value="${draggedCardId}"]`)

    if (!draggedCard) return
    if (draggedCardId == this.idValue) return

    draggedCard.remove()

    patch(`/cards/${draggedCardId}`, {
      body: JSON.stringify({
        card: {
          card_id: this.idValue
        }
      }),
      responseKind: "turbo-stream"
    })
  }
}
