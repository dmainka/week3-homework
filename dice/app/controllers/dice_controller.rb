class DiceController < ApplicationController

  def home
    render "home"
  end

  def start
    dice = [rand(1..6), rand(1..6)]
    sum = dice[0] + dice[1]

    @img1 =  "https://uchicago.s3.amazonaws.com/d0#{dice[0].to_s}.png"
    @img2 =  "https://uchicago.s3.amazonaws.com/d0#{dice[1].to_s}.png"

    if (sum == 7) || (sum == 11)
        @msg1 = "YOU WIN!"
        @msg2 = nil
        @button_link = "'/dice'"
        @button_text = "Start over"
    elsif (sum == 2) || (sum == 3) || (sum == 12)
        @msg1 = "YOU LOSE."
        @msg2 = nil
        @button_link = "'/dice'"
        @button_text = "Start over"
    else
        @goal = sum
        @msg1 = "Your goal is now #{@goal.to_s}."
        @msg2 = "Now try to get a #{@goal.to_s} again before you roll a 7."
        @button_link = "'/roll_again?Goal=#{@goal.to_s}'"
        @button_text = "Roll the dice"
    end

    render "roll_view"

  end

  def roll_again
    @goal = params["Goal"].to_i

    dice = [rand(1..6), rand(1..6)]
    sum = dice[0] + dice[1]

    @img1 =  "https://uchicago.s3.amazonaws.com/d0#{dice[0].to_s}.png"
    @img2 =  "https://uchicago.s3.amazonaws.com/d0#{dice[1].to_s}.png"

    if (sum == 7)
        @msg1 = "YOU LOSE."
        @msg2 = nil
        @button_link = "'/dice'"
        @button_text = "Start over"
    elsif (sum == @goal)
        @msg1 = "YOU WIN!"
        @msg2 = nil
        @button_link = "'/dice'"
        @button_text = "Start over"
    else
        @msg1 = "Your goal is #{@goal.to_s}."
        @msg2 = "Try to get a #{@goal.to_s} again before you roll a 7."
        @button_link = "'/roll_again?Goal=#{@goal.to_s}'"
        @button_text = "Roll the dice"
    end

    render "roll_view"

  end

end
