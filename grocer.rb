def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  while i < collection.length do
    return collection[i] if collection[i][:item] == name
    i += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  con_cart = []
  i = 0
  while i < cart.length do
    item = find_item_by_name_in_collection(cart[i][:item], con_cart)
    if item
      item[:count] += 1
    else
      item = cart[i].clone
      item[:count] = 1
      con_cart << item
    end
    i += 1
  end
  con_cart
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  # puts "\n\nPretty Printing Cart *************\n\n"
  # pp cart
  # puts "\n\nPretty Printing Coupons ***********\n\n"
  # pp coupons
  # puts "\n"
  
  i = 0
  while i < coupons.length do
    item = find_item_by_name_in_collection(coupons[i][:item], cart)
    if (item && item[:count] >= 2)
      item_with_coupon = item.clone
      item_with_coupon[:count] = coupons[i][:num]
      item_with_coupon[:price] = (coupons[i][:cost] / coupons[i][:num]).round(2)
      item_with_coupon[:item] = item_with_coupon[:item] + " W/COUPON"
      cart << item_with_coupon
      item[:count] -= coupons[i][:num]
    end
    i += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
  while i < cart.length do
    if cart[i][:clearance] then cart[i][:price] *= 0.8 end
    i += 1
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  cart = consolidate_cart(cart)
  cart = apply_coupons(cart, coupons)
  cart = apply_clearance(cart)
  total = 0
  i = 0
  while i < cart.length do 
    total += cart[i][:price] * cart[i][:count]
    i += 1
  end
  total
end
