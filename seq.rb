#!/usr/bin/env ruby

class Seq
  def initialize(initial_value = 1)
    @initial_value = initial_value
    @cache = {}
  end

  def at(step)
    step = step.to_i
    return @cache[step] if @cache[step]

    if step == 0
      @initial_value
    else
      @cache[step] = Seq.i_to_packed_s(at(step - 1))
    end
  end

  def self.i_to_packed_s(int)
    packed_array, tmp = [], []

    int.to_s.each_char do |c|
      if !tmp.empty? && tmp.last != c
        packed_array.push([tmp.last, tmp.length])
        tmp.clear
      end      
      tmp.push(c)
    end
    packed_array.push([tmp.last, tmp.length]) unless tmp.empty?

    packed_array.map { |e| "#{e[1]}#{e[0]}" }.join
  end

end

if __FILE__ == $0
  steps = ARGV.first.to_i || 7
  s = Seq.new
  
  (0..steps).each { |step| puts s.at(step) }
end