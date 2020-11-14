class MessageController < ApplicationRecord
    belongs_to :conversation, class_name: "conversation", foreign_key: "conversation_id"
    belongs_to :account, class_name: "account", foreign_key: "account_id"
end