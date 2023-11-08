class UsersController < ApplicationController
  def all_users
    @users = User.all
    render("/users_views/index")
  end

  def view_user
    username = params.fetch("username")
    @user = User.where({:username => username}).first
    @photos = Photo.where({:owner_id => @user.id})
    render("/users_views/show")
  end

  def update_user
    id = params.fetch("path_id")
    new_username = params.fetch("input_username")
    u = User.where({:id => id}).first
    u.username = new_username
    u.save
    redirect_to("/users/#{u.username}")
  end

  def delete_user
    id = params.fetch("path_id")
    user = User.where({:id => id}).first
    user.destroy
  end

  def add_user
    user = User.new
    user.username = params.fetch("input_username")
    user.save
    redirect_to("/users/#{user.username}")
  end
end
