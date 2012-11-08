require 'test/unit'
require './seq'

class SeqTest < Test::Unit::TestCase
  def test_sequence_generator_can_be_instantiated
    assert_nothing_raised { seq = Seq.new }
  end
  
  def test_sequence_values
    values = {
      '0' => '1',
      '1' => '11',
      '2' => '21',
      '3' => '1211',
      '4' => '111221',
      '5' => '312211',
      '6' => '13112221',
      '7' => '1113213211'
    }

    sequence = Seq.new(1)

    values.each do |step, value|
      assert_equal value, sequence.at(step).to_s
    end
  end

  def test_sequence_values_with_another_base
    values = {
      '0' => '5',
      '1' => '15',
      '2' => '1115',
      '3' => '3115',
      '4' => '132115',
      '5' => '1113122115',
      '6' => '311311222115'
    }

    sequence = Seq.new(5)

    values.each do |step, value|
      assert_equal value, sequence.at(step).to_s
    end
  end
end