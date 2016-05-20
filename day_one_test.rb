require "minitest/autorun"

class DayOne
  def self.get_floor(direction, floor)
    direction.chars.reduce(floor) do |delta, n|
      if n == "("
        movement = 1
      else
        movement = -1
      end
      delta += movement
    end
  end
end


class DayOneTest < Minitest::Test
  def test_we_can_move_more_than_one_floor
    current_floor = 0
    new_floor = DayOne.get_floor("((", current_floor)
    assert_equal 2, new_floor
  end
  
  def test_open_paren_goes_up_one_floor
    current_floor = 0
    new_floor = DayOne.get_floor("(", current_floor)
    assert_equal 1, new_floor
  end

  def test_close_parent_goes_down_one_floor
    current_floor = 0
    new_floor = DayOne.get_floor(")", current_floor)
    assert_equal -1 , new_floor
  end
end
