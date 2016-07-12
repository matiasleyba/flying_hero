require 'gosu'

class Hero

  def initialize

    @sprites = Gosu::Image::load_tiles('assets/images/cat.png', 847/6, 87, tileable:false)
    @x = 10
    @y = 200
    @width = @sprites.first.width
    @height = @sprites.first.height
  end

  def draw

    sprites = @sprites[Gosu::milliseconds / 75 % @sprites.size]
    sprites.draw(@x, @y, 1)


  end

  def move_up!

    if @y > 0
      @y-= 5
    end

  end

  def move_down!(height)

      if @y + @height < height
        @y += 5
      end

  end

  def bumped_into?(object)
    hero_left = @x
    hero_right = @x + @width
    hero_top = @y
    hero_bottom = @y + @height
    object_left = object.x
    object_right = object.x + object.width
    object_top = object.y
    object_bottom = object.y + object.height
    if hero_top > object_bottom
      false
    elsif hero_bottom < object_top
      false
    elsif hero_left > object_right
      false
    elsif hero_right < object_left
      false
    else
      true

    end

  end

end
