class Client < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :gyms, through: :memberships

    def total_amount 
        # return the sum of all memberships associated with the client
    end
end
