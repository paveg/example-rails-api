# @see
# setting is nothing, JSON is nest in root(here is User) .
ActiveSupport.on_load(:active_model_serializers) do
  ActiveModel::Serializer.root = false
  ActiveModel::ArraySerializer.root = false
end
