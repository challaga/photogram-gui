Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "all_users"})

  get("/users/:username", {:controller => "users", :action => "view_user"})
  get("/users", {:controller => "users", :action => "all_users"})
  post("/update_user/:path_id", {:controller => "users", :action => "update_user"})
  get("/delete_user/:path_id", {:controller => "users", :action => "delete_user"})
  post("/add_user", {:controller => "users", :action => "add_user"})

  get("/photos/:path_id", {:controller => "photos", :action => "view_photo"})
  get("/photos", {:controller => "photos", :action => "all_photos"})
  post("/update_photo/:path_id", {:controller => "photos", :action => "update_photo"})
  get("/delete_photo/:path_id", {:controller => "photos", :action => "delete_photo"})
  post("/insert_photo_record", {:controller => "photos", :action => "add_photo"})

  post("/add_comment", {:controller => "comments", :action => "add_comment"})
end
