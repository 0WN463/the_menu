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



Section.find_or_create_by!(identifier: "unmodifiable_section") do |section|
  section.label = "Standard Menu"
  section.description = "Find all our dishes here!"
  MenuSection.create!(
    menu: menu,
    section: section,
    display_order: 0,
  )
end

Section.find_or_create_by!(identifier: "modifiable_section") do |section|
  section.label = "Customized Menu"
  section.description = "Build your own dish here!"
end

