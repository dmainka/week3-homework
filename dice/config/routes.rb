Dice::Application.routes.draw do

  match '/dice', {:controller => "dice", :action => "home", :via => 'get'}

  # due to the use of button_to buttons naturally POST (which can be overridden but I chose not to do that)
  # so the routes below respond to the POST action
  match '/dice', {:controller => "dice", :action => "home", :via => 'post'}
  match '/start', {:controller => "dice", :action => "start", :via => 'post'}
  match '/roll_again', {:controller => "dice", :action => "roll_again", :via => 'post'}

  # this is old code based on in class example
  # get("/dice", { :controller => "dice", :action => "home"})
  # get("/start", { :controller => "dice", :action => "start"})
  # get("/roll_again", { :controller => "dice", :action => "roll_again"})

end
