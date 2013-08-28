def sign_in(user, options={})
  if options[:no_capybara]  
    remember_token=User.encrypt(User.new_remember_token)
    user.update_attributes(remember_token: remember_token)
    get login_path(user.remember_token)
  else
    visit login_path(user.remember_token)
  end  
end

def add_dish(name)
  fill_in "dish_magic", with: name
  click_button "dish_button"
end

def add_restaurant(name, link)
  fill_in "restaurant_magic", with: name
  fill_in "link_magic", with: link 
  click_button "rest_button"
end
