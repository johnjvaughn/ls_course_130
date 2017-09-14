require 'date'

class Meetup
  attr_reader :month, :year

  DAYS_OF_WEEK = {
    :sunday => 0,
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6,
  }

  def initialize(month, year)
    @month = month
    @year = year
    #validity check?
    save_month_data
  end

  def day(weekday, schedule)
    wday_dates = dates[DAYS_OF_WEEK[weekday]]
    day = case schedule
    when :first
      wday_dates.first
    when :second
      wday_dates[1]
    when :third
      wday_dates[2]
    when :fourth
      wday_dates[3]
    when :last
      wday_dates[-1]
    when :teenth
      wday_dates[1] >= 13 ? wday_dates[1] : wday_dates[2]
    end
    Date.new(year, month, day)
  end

  private

  attr_accessor :dates
  
  def save_month_data
    self.dates = [[], [], [], [], [], [], []]
    (1..31).each do |day|
      break unless Date.valid_date?(year, month, day)
      date = Date.new(year, month, day)
      @dates[date.wday] << day
    end
  end
end

puts Meetup.new(9, 2017).day(:friday, :teenth)