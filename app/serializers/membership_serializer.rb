class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :gym_id, :charge
  
end
