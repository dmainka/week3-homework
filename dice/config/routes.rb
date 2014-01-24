Dice::Application.routes.draw do

  get("/dice", { :controller => "dice", :action => "home"})
  get("/start", { :controller => "dice", :action => "start"})
  get("/roll_again", { :controller => "dice", :action => "roll_again"})

end
