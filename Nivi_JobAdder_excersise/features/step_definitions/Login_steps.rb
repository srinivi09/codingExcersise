Given(/^I am on sauce demo home page$/) do
  $browser.goto "https://www.saucedemo.com"
  $user = Home.new()
  $user.loginButton.wait_until_present(timeout: 30)
  puts "saucedemo page launched sucessfully"
end

And(/^I enter (.*) and (.*)$/) do |username, password|
  $user.username.set username
  $user.password.set password
end

When(/^I click on login button$/) do
  $user.loginButton.click
end

Then(/^I Should get an (.*)$/) do |loginStatus|
  case loginStatus
  when "errormessage"
    expect($user.loginErrorMessage.text.include? "Username and password do not match").to be true
    puts "user is unable to login becuase of invalid creds"
  else
    $user.cart_icon.wait_until_present(timeout:10)
    expect($user.cart_icon.present?).to be true
    puts "login is successful"
  end
end


When(/^I click on (.*) from available product list$/) do |product|
  item_available = $user.productItemCounter.count
  for i in 0..item_available-1
    if $user.productItem(i).text.include?product
      $user.addToCart(i).click
      break
    elsif i==item_available-1
      abort "product not available in the list"
    end
  end
end

Then(/^I should be able to view the (.*) in the cart$/) do |product|
  $user.cart_icon.when_present.click
  expect($user.cartCheck.text.include? product).to be true
end