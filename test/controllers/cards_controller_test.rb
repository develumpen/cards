require "test_helper"

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url
    assert_response :success
  end

  test "should get new" do
    get new_card_url
    assert_response :success
  end

  test "should create card" do
    assert_difference("Card.count") do
      post cards_url, params: { card: { card_id: @card.card_id, title: @card.title } }
    end

    assert_redirected_to card_url(Card.last)
  end

  test "should show card" do
    get card_url(@card)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@card)
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { card_id: @card.card_id, title: @card.title } }
    assert_redirected_to card_url(@card)
  end

  test "should destroy card" do
    # -2 because has a nested card
    assert_difference("Card.count", -2) do
      delete card_url(@card)
    end

    assert_redirected_to cards_url
  end
end
