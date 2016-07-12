require 'gosu'
require_relative 'flying_item'

class Asteroid < FlyingItem
  attr_accessor :x
  def initialize(window)
    super
    @scale_x = 1
    @scale_y = 1
    @y = Random.rand(window.height - @height)
    @x = window.width - 100
  end

  def self.image_path
    'assets/images/asteroid.png'
  end

  def draw
    @image.draw(@x, @y, 1, @scale_x, @scale_y)

  end

end
