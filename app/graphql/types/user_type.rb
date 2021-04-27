module Types
  class UserType < Types::BaseObject
    # user attributes
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    
    # user methods
    field :full_name, String, null: false
    field :items, [Types::ItemType], null: false
    field :current_time, GraphQL::Types::ISO8601DateTime, null: false

    def full_name
      # `object` references the user instance
      [object.first_name, object.last_name].compact.join(" ")
    end

    def items
      object.items
    end

    def current_time
      Time.now
    end
  end
end
