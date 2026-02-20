module CardsHelper
  def card_actions(card)
    return unless showing_current(card)
    [ clickable(card), draggable(card), droppable(card) ].join(" ")
  end

  private
    def showing_current(card)
      params[:id].to_i != card.id
    end

    def clickable(card)
      "click->card#goToCard"
    end

    def draggable(card)
      "dragstart->card#dragStart dragover->card#dragOver"
    end

    def droppable(card)
      "drop->card#drop"
    end
end
