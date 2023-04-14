class ClientMembershipSumSerializer < ActiveModel::Serializer
  attributes :id, :name, :memberships, :sum
  has_many :memberships

  def sum  
    sum = 0
    mems = Membership.all
    mems.each { |m| sum+= m.charge}
    sum
  end
end
