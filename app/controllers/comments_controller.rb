class CommentsController < ApplicationController
  def add_comment
    photo_id = params.fetch("input_photo_id")
    user_id = params.fetch("input_author_id")
    user_comment = params.fetch("input_comment")
    the_comment = Comment.new
    the_comment.photo_id = photo_id
    the_comment.author_id = user_id
    the_comment.body = user_comment
    the_comment.save
    redirect_to("/photos/#{photo_id}")
  end
end
