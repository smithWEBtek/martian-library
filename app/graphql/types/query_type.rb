module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :items,
          [Types::ItemType],
          null: false,
          description: "Returns a list of items in the Martian Library"

    field :users,
          [Types::UserType],
          null: false,
          description: "Returns list of users."

    def items
      # Item.all
      
      # https://evilmartians.com/chronicles/graphql-on-rails-1-from-zero-to-the-first-query
      # The easiest way to avoid N+1 queries is to use eager loading.
      # In our case, we need to preload users when making a query to fetch items in QueryType:
      Item.preload(:user)
    end

    def users
      User.all
    end
  end
end
