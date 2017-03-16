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
end
