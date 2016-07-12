require 'gosu'
require_relative 'game'

class Score
  def initialize
    @font = Gosu::Font.new(72, name: 'Arial')
    @score = 0

  end

  def draw
    @font.draw(@score,10,10,2)

  end

  def update_score!(score)
    @score += score

  end

end
