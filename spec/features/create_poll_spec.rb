require 'rails_helper'

describe "In poll create page", :type => :feature do

  context "Only w/image A uploaded" do
    before do
      user = User.create(name:"tester", email:"test@test.cl") #def create --> polls controller is were we need to set id: 1 to execute the before do loop...
      visit '/'
      attach_file('poll-capture-a', File.join(Rails.root, '/app/assets/images/car_a.jpg'))
      sleep 1
    end

    it "Submit-btn should still = 'Vs'(not 'check')" do
      expect(page).to have_selector('.submit-btn', :text => "Vs")
    end

    # it "Should have reset button A" do
    #   expect(page).to have_selector('#reset-button-a:fa-close')
    #   # expect(page).to have_selector('#reset-button-b')
    # end

  end

  context "Only w/image B uploaded" do
    before do
      user = User.create(name:"tester", email:"test@test.cl") #def create --> polls controller is were we need to set id: 1 to execute the before do loop...
      visit '/'
      attach_file('poll-file-b', File.join(Rails.root, '/app/assets/images/car_b.jpg'))
    end

    it "Submit-btn should still = 'Vs'(not 'check')" do
      expect(page).to have_selector('.submit-btn', :text => "Vs")
    end
  end

# A backend test(?): from controller not to allow create a poll instance w/o 2 poll items?

end
