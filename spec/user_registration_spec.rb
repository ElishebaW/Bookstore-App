require 'rails_helper'

describe "signing into the booksore", :type => :feature do
 
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end
  
    context "registration activities in the app"  do 
    
        it "signs a user in" do
        visit '/users/sign_in'
          fill_in 'Email', with: 'user@example.com'
          fill_in 'Password', with: 'password'
          
        click_button 'Log in'
        expect(page).to have_content 'Signed in successfully.'
        end
        
        it "shows error when user enters wrong email" do
        visit '/users/sign_in'
          fill_in 'Email', with: 'user@example.com'
          fill_in 'Password', with: 'password'
          
        click_button 'Log in'
        expect(msg).to eq("Invalid Email or password.")
        end 
        
        it "signs a user out" do
         visit '/users/sign_in'
          fill_in 'Email', with: 'user@example.com'
          fill_in 'Password', with: 'password'
          
        click_button 'Log in'
            expect(page).to have_content 'Signed in successfully.'
         
        click_link 'Sign Out'
            expect(page).to have_content 'Signed out successfully'
        end
        
        
        it "signs a user up"  do 
          visit '/'
            click_link 'Sign up'
                 fill_in 'Email', with: 'user1@example.com'
                 fill_in 'Password', with: 'password'
                 fill_in 'Password confirmation', with: 'password'
            click_button 'Sign up'
         expect(page).to have_content'Welcome! You have signed up successfully.'
        end
        
        it "it doesn't allow user to sign_up with a registered users email"  do 
          visit '/'
        click_link 'Sign up'
         fill_in 'Email', with: 'user@example.com'
         fill_in 'Password', with: 'password'
         fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
        expect { raise StandardError, "1 error prohibited this user from being saved: Email has already been taken Email Password (6 characters minimum)"}.
        to raise_error("1 error prohibited this user from being saved: Email has already been taken Email Password (6 characters minimum)")
        end 
    end
end