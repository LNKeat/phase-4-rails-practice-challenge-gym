class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :memberships

  has_many :memberships


end
