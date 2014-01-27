class DiceController < ApplicationController

  # handle the home screen (gives instructions and a button to start the games)
  def home
    render "home_view"
  end

  # the next two methods (start, roll_again) separate the first roll from all
  # subsequent rolls. These could have been incorporated into one procedure
  # but to more clearly distuguish the logic and the fact that one needs params
  # (roll_again) and the other (start) doesn't I decided to separate these.

  # handle the first roll which checks that the player doesn't immediately
  # win or lose.  If neither applies then we set the goal equal to the sum
  # of the dice which is passed as a query string parameter
  def start
    # simulate rolling the dice
    dice = [rand(1..6), rand(1..6)]
    sum = dice[0] + dice[1]

    # present images corresponding to the simulated dice rolls
    @img1 =  "https://uchicago.s3.amazonaws.com/d0#{dice[0].to_s}.png"
    @img2 =  "https://uchicago.s3.amazonaws.com/d0#{dice[1].to_s}.png"

    # game logic
    if (sum == 7) || (sum == 11)
        @goal = nil
        @msg1 = "YOU WIN!"
        @msg2 = nil
        @button_path = dice_path
        @button_text = "Start over"
    elsif (sum == 2) || (sum == 3) || (sum == 12)
        @goal = nil
        @msg1 = "YOU LOSE."
        @msg2 = nil
        @button_path = dice_path
        @button_text = "Start over"
    else
        @goal = sum
        @msg1 = "Your goal is now #{@goal.to_s}."
        @msg2 = "Now try to get #{@goal.to_s} again before you roll a 7."
        @button_path = roll_again_path("Goal" => @goal)
        @button_text = "Roll the dice"
    end

    render "roll_view"
  end

  # handle all rolls after the first
  def roll_again
    # get the goal from query string parameter
    @goal = params["Goal"].to_i

    # simulate rolling the dice
    dice = [rand(1..6), rand(1..6)]
    sum = dice[0] + dice[1]

    # present images corresponding to the simulated dice rolls
    @img1 =  "https://uchicago.s3.amazonaws.com/d0#{dice[0].to_s}.png"
    @img2 =  "https://uchicago.s3.amazonaws.com/d0#{dice[1].to_s}.png"

    # game logic
    if (sum == 7)
        @msg1 = "YOU LOSE."
        @msg2 = nil
        @button_path = dice_path
        @button_text = "Start over"
    elsif (sum == @goal)
        @msg1 = "YOU WIN!"
        @msg2 = nil
        @button_path = dice_path
        @button_text = "Start over"
    else
        @msg1 = "You rolled a #{sum.to_s}."
        @msg2 = "Try to get another #{@goal.to_s} before you roll a 7."
        @button_path = roll_again_path("Goal" => @goal)
        @button_text = "Roll the dice"
    end

    render "roll_view"
  end

end
