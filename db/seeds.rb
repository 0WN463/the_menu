# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


menu = Menu.find_or_create_by!(identifier: "menu_id") do |menu|
  menu.label = "The Grand Menu"
  menu.state = "published"
  menu.start_date = DateTime.now()
  menu.end_date = DateTime.now()
end


seasonal_section = Section.find_or_create_by!(identifier: "seasonal_items") do |section|
  section.identifier = "seasonal_items"
  section.label = "Seasonal Items"
section.description = "Freshest dishes seasonally. Subject to availability"

  MenuSection.create!(
    menu: menu,
    section: section,
    display_order: 2,
  )

  Item.find_or_create_by!(identifier: "salmon_sashimi") do |item|
    item.identifier = "salmon_sashimi"
    item.item_type = "product"
    item.label = "Salmon Sashimi"
    item.description = "Fresh raw salmon slices"
    item.price = 10.90
    item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/918170367_894003467SalmonSashimi.jpg"

    SectionItem.create!(
      section: section,
      item: item,
    )
  end

  Item.find_or_create_by!(identifier: "tuna_sashimi") do |item|
    item.identifier = "tuan_sashimi"
    item.item_type = "product"
    item.label = "Tuna Sashimi"
    item.description = "Fresh raw Maguro tuna slices"
    item.price = 10.90
    item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/1199835770_839088232MaguroSashimi.jpg"

    SectionItem.create!(
      section: section,
      item: item,
    )
  end
end

customizable_section = Section.find_or_create_by!(identifier: "modifiable_section") do |section|
  section.identifier = "custom_dishes"
  section.label = "Customized Dishes"
  section.description = "Build your own dish here!"

  MenuSection.create!(
    menu: menu,
    section: section,
    display_order: -1,
  )
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

Item.find_or_create_by!(identifier: "saba") do |item|
  item.identifier = "saba"
  item.item_type = "product"
  item.label = "Saba Shioyaki"
  item.description = "Roasted salted Saba fish"
  item.price = 10.90
  item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/1756374579_1028141571SabaShioyaki.jpeg"

  SectionItem.create!(
    section: standard_section,
    item: item,
  )
end

Item.find_or_create_by!(identifier: "salmon") do |item|
  item.identifier = "salmon"
  item.item_type = "product"
  item.label = "Salmon Teriyaki"
  item.description = "Roasted Salmon in teriyaki sauce"
  item.price = 12.90
  item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/1511435477_1507079376SalmonTeriyaki.jpeg"

  SectionItem.create!(
    section: standard_section,
    item: item,
    display_order: 1,
  )
end

Item.find_or_create_by!(identifier: "udon") do |item|
  item.identifier = "udon"
  item.item_type = "product"
  item.label = "Udon"
  item.description = "Udon noodles dipped in broth"
  item.price = 8.90
  item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/1494436658_TeriyakiToriUdon.jpg"

  SectionItem.create!(
    section: standard_section,
    item: item,
    display_order: -1,
  )
end


Item.find_or_create_by!(identifier: "gyudon") do |item|
  item.identifier = "gyudon"
  item.item_type = "product"
  item.label = "Gyudon"
  item.description = "Customizable beef bowl"
  item.price = 10.90
  item.image_url = "https://s3-ap-southeast-1.amazonaws.com/getz-prod/c7a51885-fcf7-47de-8500-9eb412649d7d/1028448573_MiniCheezuGyudon.jpg"

  SectionItem.create!(
    section: customizable_section,
    item: item,
  )


  toppings = ModifierGroup.find_or_create_by!(identifier: "toppings") do |group|
    group.identifier = "topping"
    group.label = "Toppings"
    group.selection_required_min = 1
    group.selection_required_max = 3

   [ "egg", "ginger", "cheese" ].each_with_index do |topping, i|
      topping_item = Item.find_or_create_by!(identifier: topping) do |item|
        item.identifier = topping
        item.item_type = "component"
        item.label = topping
        item.description = "topping for beef bowl"
        item.price = 0.90


        Modifier.create!() do |mod|
          mod.display_order = i
          mod.price_override = 0.5 * i
          mod.modifier_group = group
          mod.item = item
        end
      end
    end
  end

  ItemModifierGroup.create!(
    modifier_group: toppings,
    item: item,
  )
end
