class HomeSerializer < ActiveModel::Serializer
  attributes :message

  def message
    @unread_messages_count
  end
end
