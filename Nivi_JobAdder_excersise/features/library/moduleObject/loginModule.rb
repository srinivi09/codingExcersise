module Login_page

  def username
    $browser.text_field(id: 'user-name')
  end

  def password
    $browser.text_field(id: 'password')
  end

  def loginButton
    $browser.button(id: 'login-button')
  end

  def loginErrorMessage
    $browser.div(class: %w(error-message-container error))
  end

  def cart_icon
    $browser.div(id: 'shopping_cart_container')
  end

  def productItemCounter
    $browser.div(class: 'inventory_list').divs(class:'inventory_item')
  end

  def productItem(itemindex)
    $browser.div(class: 'inventory_list').div(class:'inventory_item',index:itemindex)
  end

  def addToCart(itemindex)
    $browser.div(class: 'inventory_list').div(class:'inventory_item',index:itemindex).button(text: 'Add to cart')
  end

  def cartCheck
    $browser.div(class: 'cart_item').div(class: 'inventory_item_name')
  end

end