require "pry"
require "date"

class Reservation
  ROOM_RATE = 200
  attr_accessor :name, :room_id, :start_date, :end_date, :total_cost

  def initialize(name:, room_id:, start_date:, end_date:)
    @name = name
    @room_id = room_id
    if start_date.is_a? String
      @start_date = Date.parse(start_date)
    else
      @start_date = start_date
    end
    if end_date.is_a? String
      @end_date = Date.parse(end_date)
    else
      @end_date = end_date
    end
    if @start_date > @end_date
      raise ArgumentError, "The start_date should be before the end_date"
    end

    @total_cost = total_cost
  end

  def total_cost
    date_range = (@end_date - @start_date)
    total_cost = date_range.to_i * ROOM_RATE
    return total_cost
  end

  def is_overlap?(start_date, end_date)
    return @end_date > start_date && @start_date < end_date
  end

  def contain_date?(date)
    return @end_date > date && @start_date <= date
  end

  def same_daterange?(start_date, end_date)
    return @start_date == start_date && @end_date == end_date
  end
end

# binding.pry
