require 'rails_helper'

describe "In share poll page", :type => :feature do

  before do
    user = User.create(name:"tester", email:"test@test.cl") #def create --> polls controller is were we need to set id: 1 to execute the before do loop...
    visit '/'
    attach_file('poll-capture-a', File.join(Rails.root, '/app/assets/images/car_a.jpg'))
    attach_file('poll-file-b', File.join(Rails.root, '/app/assets/images/car_b.jpg'))
    page.find(:css, '.submit-btn').click
  end

  it "Should go to the poll share page" do
    expect(page).to have_current_path(/polls/)
  end

  it "Should have 2 pictures loaded" do
    expect(page).to have_selector('#item-a-image-container')
    expect(page).to have_selector('#item-b-image-container')
  end

  it "Should have a clickeable menu button" do
    find(".btn-menu").click
  end

  it "Should show a vote counter after clicking image A" do
    find("#item-a-image-container").click
    sleep 1
    expect(page).to have_selector('#vote-count-a')
  end

  it "Should have a share button w/ clickeable social media buttons" do
    find("#share-button").click
    sleep 1
    find('.twitter-c').click
    find('.whatsapp-c').click
    find(".facebook-c").click
  end

end
