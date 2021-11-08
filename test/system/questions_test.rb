require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "asking question yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
  end

  test "Coach says Great! when saying I am going to work" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "Ask"

    assert_text "Great!"
  end

  test "has a button Ask a new question that link to /ask" do
    visit answer_url
    click_on "Ask a new question"

    assert_selector "p", text: "Ask your coach anything"
  end
end
