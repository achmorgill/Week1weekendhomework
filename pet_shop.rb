def pet_shop_name(pet_shop) 
#returns the name of the pet shop
  return pet_shop[:name]
end

def total_cash(pet_shop)
#returns the total sales 
    return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
 # updates the sales total
  current_total_cash = total_cash(pet_shop)
  new_total_cash = current_total_cash + cash
  pet_shop[:admin][:total_cash] = new_total_cash
  return new_total_cash

end

def pets_sold(pet_shop)
#returns the total number of pets sold
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,no_pets_sold)
#adds the number sold to the total sold
  new_pets_sold = pets_sold(pet_shop) + no_pets_sold
  pet_shop[:admin][:pets_sold] = new_pets_sold
  return new_pets_sold
end

def stock_count(pet_shop)
#returns the number of entries in the pets array i.e. number of total pets in the pet shop
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
#returns an array which includes all dogs of the breed passed
  pets_breed_array = Array.new

  pet_shop[:pets].each { |pet|
    if pet[:breed] == breed
      pets_breed_array << pet
  
    end
  } 
  return pets_breed_array
end
 
 def find_pet_by_name(pet_shop,name_of_pet)
  #returns pet name if one exist in the petshop 
 # pets_name_array = {}
  pet_shop[:pets].each {|pet|
    if pet[:name]==name_of_pet
      # pets_name_array[:name] == name_of_pet
      return name_of_pet
    else
      next 
    end
  }
  return nil 
 end

 

def remove_pet_by_name(pet_shop,pet_name)
   #remove a pet from the pets hash array
   for pet in pet_shop[:pets]
      if pet[:name] == pet_name
        return pet_shop[:pets].delete(pet)
      end
  end
  return nil
end

def add_pet_to_stock(pet_shop, pet_name)
  #Add a new pet into the pets hash array
  pet_shop[:pets].push(pet_name)
end

def customer_pet_count(customers)
  #returns how many pets each customer has
    return customers[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
#Add a new pet to the customer details
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer,new_pet)
#Check the customer can afford to buy a new pet 

  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet_name, customer)
#   #check the pet is for sale in the pet shop
  
  if pet_name == nil
    return nil
  end
# # check the customer has funds to buy the new pet
# this doesn't test doesn't work
  if customer_can_afford_pet(customer,pet_name) == false
    return nil
  end


  pet_shop[:pets].each {|pet|
    if pet[:name] == pet_name
     
      cost_of_pet = pet[:price]
      customer[:pets].push(pet_name)
      increase_pets_sold(pet_shop,1)
      add_or_remove_cash(pet_shop, cost_of_pet)
      customer[:cash] = customer[:cash] - cost_of_pet
      remove_pet_by_name(pet_shop,pet[:name])

    end
  }
  end







  




