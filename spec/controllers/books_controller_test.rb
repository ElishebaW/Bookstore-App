require 'rails_helper'

describe BooksControllerit < ActionController::itCase do 
  context' it basic methods on books controller' do 
    it "should get new" do
      get :new
      assert_response :success
    end
  
    it "should get create" do
      get :create
      assert_response :success
    end
  
    it "should get update" do
      get :update
      assert_response :success
    end
  
    it "should get edit" do
      get :edit
      assert_response :success
    end
  
    it "should get destroy" do
      get :destroy
      assert_response :success
    end
  
    it "should get index" do
      get :index
      assert_response :success
    end
  
    it "should get show" do
      get :show
      assert_response :success
      expect( @books).to eq(Book.find(params[:id]))
    end
  end
  
describe "user log in" do
  it "allows an existing user to sign in" do
    User.create!(email: "me@home.com", password: "watching the telly")

    visit "/users/sign_in"

    fill_in "Email", with: "me@example.com"
    fill_in "Password", with: "watching the telly"

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
  end
end
end
