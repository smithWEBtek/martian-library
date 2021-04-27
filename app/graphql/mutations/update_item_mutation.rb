module Mutations
  class UpdateItemMutation < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :attributes, Types::ItemAttributes, required: true

    field :item, Types::ItemType, null: true
    field :errors, Types::ValidationErrorsType, null: true

    def resolve(id:, title:, description: nil, image_url: nil)
      check_authentication!
      item = Item.find(id)
      if item.update(title: title, description: description, image_url: image_url)
        { item: item }
      else
        { errors: item.errors.full_messages }
      end
    end
  end
end
