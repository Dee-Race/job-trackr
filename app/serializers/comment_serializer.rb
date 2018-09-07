class CommentSerializer < ActiveModel::Serializer 
  attributes :id, :content, :application_id

  belongs_to :application
end
