require 'gosu'
require_relative 'background'
require_relative 'hero'
require_relative 'candy'
require_relative 'asteroid_big'
require_relative 'asteroid_small'
require_relative 'score'

class Game < Gosu::Window

  def initialize
    super(900, 440, fullscreen: false)

    self.caption = 'Flying Hero!'
    @background = Background.new
    @hero = Hero.new
    @candy = Candy.new(self)
    set_asteroid
    @scoreboard = Score.new

  end

  def set_asteroid
    @asteroid = @asteroid && @asteroid.instance_of?(AsteroidBig) ?
      AsteroidSmall.new(self) : AsteroidBig.new(self)

  end


    def draw

      @background.draw
      @hero.draw
      @candy.draw
      @asteroid.draw
      @scoreboard.draw

    end

    def button_down(id)

      if id == Gosu::KbEscape

        close
      end

    end

    def update
      @background.scroll!
      @candy.move!
      @asteroid.move!

      if @asteroid.x < 0
        set_asteroid

      end
      if @candy.x < 0
        @candy.reset!(self)
      end

      if button_down?(Gosu::KbUp)

        @hero.move_up!

      elsif button_down?(Gosu::KbDown)

      @hero.move_down!(height)
      end

      if @hero.bumped_into?(@candy)
        @candy.reset!(self)
        @scoreboard.update_score!(@candy.points)
      end

    end

end
