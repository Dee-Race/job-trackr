class CommentSerializer < ApplicationSerializer
  attributes :id, :content, :application_id

  belongs_to :application
end
