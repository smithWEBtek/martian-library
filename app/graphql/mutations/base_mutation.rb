module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
  end
end

# by default we got this, but we're using the above for a simpler implementation
# module Mutations
#   class BaseMutation < GraphQL::Schema::RelayClassicMutation
#     argument_class Types::BaseArgument
#     field_class Types::BaseField
#     input_object_class Types::BaseInputObject
#     object_class Types::BaseObject
#   end
# end
