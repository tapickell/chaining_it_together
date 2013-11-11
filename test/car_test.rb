require 'minitest/autorun'
require './lib/car'

class TestCar < MiniTest::Test
  def setup
  end

  def test_can_init_without_chaining
    car = Car.new
    assert_equal car.nil?, false
  end

  def test_default_number_of_seats
    car = Car.new
    assert_equal car.number_of_seats, 1
  end

  def test_can_chain_two_methods_to_init
    car = Car.new.is_painted('green').can_seat(2)
    assert_equal car.color, 'green'
    assert_equal car.number_of_seats, 2
  end

  def test_can_chain_method_multiple_times
    car = Car.new.is_painted('silver').can_go_up_to(88).can_seat(2).is_painted('stainless')
    assert_equal car.color, 'stainless'
  end

  def test_passengers_is_array
    car = Car.new.with('Todd')
    assert_instance_of Array, car.passengers
  end

  def test_will_only_hold_passengers_there_is_room_for
    car = Car.new.can_seat(2).with('Todd', 'Amy', 'Ethan')
    assert_equal car.passengers, ['Todd', 'Amy']
  end

  def test_will_not_break_with_passengers_less_than_seats
    car = Car.new.can_seat(4).with('Todd')
    assert_equal car.passengers, ['Todd']
  end
end
