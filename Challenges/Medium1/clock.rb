class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  def initialize(hour=0, minute=0)
    carry, @minute = minute.divmod(MINUTES_IN_HOUR)
    @hour = (hour + carry) % HOURS_IN_DAY
  end

  def +(minutes)
    Clock.new(@hour, @minute + minutes)
  end

  def -(minutes)
    self.+(-1 * minutes)
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    @hour.to_s.rjust(2, '0') + ":" + @minute.to_s.rjust(2, '0')
  end

  def self.at(hour=0, minute=0)
    new(hour, minute)
  end
end

clock = Clock.at(10)
p clock.to_s
clock += 3
p clock.to_s
