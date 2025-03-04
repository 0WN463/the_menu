# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


menu = Menu.find_or_create_by!(identifier:"menu_id") do |menu|
  menu.label = "The Grand Menu"
  menu.state = "published"
  menu.start_date = DateTime.now()
  menu.end_date = DateTime.now()
end



standard_section = Section.find_or_create_by!(identifier: "unmodifiable_section") do |section|
  section.identifier = "standard_dishes"
  section.label = "Standard Dishes"
  section.description = "Find all our dishes here!"
  MenuSection.create!(
    menu: menu,
    section: section,
    display_order: 0,
  )
end

customizable_section = Section.find_or_create_by!(identifier: "modifiable_section") do |section|
  section.identifier = "custom_dishes"
  section.label = "Customized Dishes"
  section.description = "Build your own dish here!"
end


Item.find_or_create_by!(identifier: "saba") do |item|
  item.identifier = "saba"
  item.item_type = "product"
  item.label = "Saba Shioyaki"
  item.description = "Roasted salted Saba fish"
  item.price = 10.90

  SectionItem.create!(
    section: standard_section,
    item: item,
  )
end

Item.find_or_create_by!(identifier: "sanma") do |item|
  item.identifier = "sanma"
  item.item_type = "product"
  item.label = "Sanma Shioyaki"
  item.description = "Roasted salted Sanma fish"
  item.price = 12.90

  SectionItem.create!(
    section: standard_section,
    item: item,
  )
end

Item.find_or_create_by!(identifier: "yakisoba") do |item|
  item.identifier = "yakisoba"
  item.item_type = "product"
  item.label = "Yaki Soba"
  item.description = "Stir-fried soba noodles. Commonly seen in festivals"
  item.price = 8.90

  SectionItem.create!(
    section: standard_section,
    item: item,
  )
end


Item.find_or_create_by!(identifier: "gyudon") do |item|
  item.identifier = "gyudon"
  item.item_type = "product"
  item.label = "Gyudon"
  item.description = "Customizable beef bowl"
  item.price = 10.90

  SectionItem.create!(
    section: customizable_section,
    item: item,
  )


  toppings = ModifierGroup.find_or_create_by!(identifier: "toppings") do |group|
    group.identifier = "topping"
    group.label = "Toppings"
    group.selection_required_min = 1
    group.selection_required_max = 3

   ["egg", "ginger", "cheese"].each_with_index do |topping, i|
      topping_item = Item.find_or_create_by!(identifier: topping) do |item|
        item.identifier = topping
        item.item_type = "component"
        item.label = topping
        item.description = "topping for beef bowl"
        item.price = 0.90
      end


      Modifier.create!() do |mod|
        mod.display_order = i
        mod.price_override = 0.5 * i
        mod.modifier_group = group
        mod.item = topping_item
      end
    end
  end

  ItemModifierGroup.create!(
    modifier_group: toppings,
    item: item,
  )
end
