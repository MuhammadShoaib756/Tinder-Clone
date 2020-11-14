class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    validates_uniqueness_of :sender, scope: :receipient

    scope :between, ->(sender, receipient) do
       where("(sender = ? AND receipient = ?) OR (sender = ? AND receipient = ?)", sender, receipient) 
    end
end