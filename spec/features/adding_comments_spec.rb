require 'rails_helper'

RSpec.feature "Adding Reviews to Articles" do

  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create(title: "The first article", body: "Body of the first article", user: @john)
  end

  scenario "permits user to write a review" do
    login_as(@fred)
    visit "/"

    click_link @article.title
    fill_in "New Comment", with: "Awsome article !"
    click_button "Add Comment"

    expect(page).to have_content("Comment has been created")
    expect(page).to have_content("Awsome article !")
    #expect(current_path).to eq(articles_path(@article.comments.last.article_id))
    #expect(current_path).to eq(articles_path(@article))
  end

end