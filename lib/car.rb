class Car
  attr_reader :color, :top_speed, :number_of_seats, :music_format
  def initialize
    @number_of_seats = 1
    @color = 'black'
    @top_speed = 1
    @music_format = 'eight track cassette'
  end

  def passengers
    @passengers.first(@number_of_seats) || []
  end

  def can_play(music_format)
    @music_format = music_format
    self
  end

  def can_go_up_to(top_speed)
    @top_speed = top_speed
    self
  end

  def can_seat(number_of_seats)
    @number_of_seats = number_of_seats
    self
  end

  def with(*passengers)
    @passengers = Array(passengers)
    self
  end

  def is_painted(color)
    @color = color
    self
  end
end
