require 'gosu'

class Scoreboard
  def initialize
@score=0


  end
  def draw
  @scoredraw = Gosu::Image.from_text(self,@score,Gosu.default_font_name,30)
    @scoredraw.draw(10,10,2)
  end
  def info
"Scoreboard:#{@Scoredraw}"
  end

  def update_score!(points)
   @score += points


    end
  def game_over
if  @score < 0
  true
else
  false
end
end
end
