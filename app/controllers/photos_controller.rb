class PhotosController < ApplicationController
  def all_photos
    @photos = Photo.all
    render("/photos_views/index")
  end

  def view_photo
    id = params.fetch("path_id")
    @photo = Photo.where({:id => id}).first
    render("/photos_views/show")
  end
  def update_photo
    id = params.fetch("path_id")
    photo = Photo.where({:id => id}).first
    photo.image = params.fetch("input_image")
    photo.caption = params.fetch("input_caption")
    photo.save

    redirect_to("/photos/#{id}")
  end
  def delete_photo
    id = params.fetch("path_id")
    photo = Photo.where({:id => id}).first
    photo.destroy
    redirect_to("/photos")
  end

  def add_photo
    photo = Photo.new
  photo.image = params.fetch("input_image")
  photo.owner_id = params.fetch("input_owner_id")
  photo.caption = params.fetch("input_caption")
  photo.save
  redirect_to("/photos/#{photo.id}")
  end

end
