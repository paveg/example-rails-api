class UserSerializer < ActiveModel::Serializer
  # would not include date data in response, so restrict to output attr.
  attributes :id, :name, :mail, :password

  # @see
  # would not include password in response, instead of output string.
  def password
    "xxxxxxxx"
  end

end
