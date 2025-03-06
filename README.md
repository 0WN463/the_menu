# Setup

## Tested version
Rails version: Rails 8.0.1
Ruby version: ruby 3.3.7 (2025-01-15 revision be31f993d7) [x86_64-linux]

Note that we have 2 branches:
* `main` which uses postgres, which is a requirement for our deployment platform
* `sqllite` which uses SQLLite, which is much easier to setup and run locally

I would recommend using the `sqllite` branch instead since that is much easier to setup locally, since the only reason we used postgres was because of a limitation of our deployment platform.

# Getting Started

Make sure that [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Rails](https://guides.rubyonrails.org/install_ruby_on_rails.html) are installed on your system.

Then we can launch the server.

```
rails db:reset # setup DB and seed it with data
rails server # start server
```

## Tests

As a sanity check, we have validation tests which can be ran to know that the environment is setup correctly.

```
rails test
```

And we should see that all tests passes

```
Running 14 tests in a single process (parallelization threshold is 50)
Run options: --seed 5957

# Running:

..............

Finished in 0.359183s, 38.9773 runs/s, 69.6024 assertions/s.
14 runs, 25 assertions, 0 failures, 0 errors, 0 skips
```


An `example_payload.json` is available at project root.
This displays the menu and all its children.

```
curl -X POST $API_URL -d @payload.json \
--header "Content-Type: application/json" --header "accept: application/json, multipart/mixed" 
```

Response:

```
{"data":{"menus":[{"identifier":"menu_id","label":"The Grand Menu","sections":[{"identifier":"standard_dishes","label":"Standard Dishes","items":[{"identifier":"saba","label":"Saba Shioyaki","modifierGroups":[]},{"identifier":"sanma","label":"Sanma Shioyaki","modifierGroups":[]},{"identifier":"yakisoba","label":"Yaki Soba","modifierGroups":[]}]},{"identifier":"custom_dishes","label":"Customized Dishes","items":[{"identifier":"gyudon","label":"Gyudon","modifierGroups":[{"identifier":"topping","modifiers":[{"item":{"label":"egg"},"priceOverride":0.0},{"item":{"label":"ginger"},"priceOverride":0.5},{"item":{"label":"cheese"},"priceOverride":1.0}]}]}]}]}]}}
```

# API

API definitions are available at [schema.graphql](./schema.graphql).

Available queries:

```
menus
sections
items
modifier_groups
```


Available mutations:

```
menuCreate
menuDelete

addSectionToMenu
removeSectionFromMenu

sectionCreate
sectionDelete

addItemToSection
removeItemFromSection

itemCreate
itemDelete

addModifierGroupToItem
removeModifierGroupFromItem

modifierGroupCreate
modifierGroupDelete

addModifierToModifierGroup
removeModifierFromModifierGroup
```

# Validations

## Uniqueness validation

For concrete resources (menu, section, item, modifier group), uniqueness of `identifier`.

For relation resources which links resource A to resource B, uniqueness of pair of resource A and resource B.

## Value validation

Presence of `identifier` and `label`.

Menu.state must be `draft` or `published`

Item.item_type must be `product` or `component`

