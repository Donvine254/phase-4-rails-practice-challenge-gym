class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age
end

class ClientShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_amount
end