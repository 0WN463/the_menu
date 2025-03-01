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
  menu.state = "ready"
  menu.start_date = DateTime.now()
  menu.end_date = DateTime.now()
end



standard_section = Section.find_or_create_by!(identifier: "unmodifiable_section") do |section|
  section.label = "Standard Dishes"
  section.description = "Find all our dishes here!"
  MenuSection.create!(
    menu: menu,
    section: section,
    display_order: 0,
  )
end

Section.find_or_create_by!(identifier: "modifiable_section") do |section|
  section.label = "Customized Dishes"
  section.description = "Build your own dish here!"
end


Item.find_or_create_by!(identifier: "saba") do |item|
  #item.type = "Product"
  item.label = "Saba Shioyaki"
  item.description = "Roasted salted Saba fish"
  item.price = 10.90

  SectionItem.create!(
    section: standard_section,
    item: item
  )
end

Item.find_or_create_by!(identifier: "sanma") do |item|
  #item.type = "Product"
  item.label = "Sanma Shioyaki"
  item.description = "Roasted salted Sanma fish"
  item.price = 12.90

  SectionItem.create!(
    section: standard_section,
    item: item
  )
end

Item.find_or_create_by!(identifier: "yakisobi") do |item|
  #item.type = "Product"
  item.label = "Yaki Soba"
  item.description = "Stir-fried soba noodles. Commonly seen in festivals"
  item.price = 8.90

  SectionItem.create!(
    section: standard_section,
    item: item
  )
end
