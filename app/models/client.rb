class Client < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :gyms, through: :memberships

  def total_amount
    # return the sum of all memberships associated with the client
    total_amount = 0
    memberships.each do |membership|
      total_amount += membership.charge
    end
    total_amount
  end
end
