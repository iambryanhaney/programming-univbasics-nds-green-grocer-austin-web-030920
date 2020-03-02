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
    item = find_item_by_name_in_collection(coupon[i][:item], cart)
    if (item && item[:count] >= 2)
      item_with_coupon = item.clone
      item_with_coupon[:count] = coupon[i][:num]
      item_with_coupon[:price] = (coupon[i][:cost] / coupon[i][:count]).round(2)
      item_with_coupon[:item] = item_with_coupon[:item] + " W/COUPON"
      cart << item_with_coupon
      item[:count] -= coupon[i][:num]
    end
    i += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
end
