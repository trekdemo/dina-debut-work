class EnglishNumber < SimpleDelegator

  ONES = %w[ zero one two three four five six seven eight nine ]
  TEEN = %w[ ten eleven twelve thirteen fourteen fifteen sixteen seventeen
             eighteen nineteen ]
  TENS = %w[ zero ten twenty thirty forty fifty sixty seventy eighty ninety ]
  MEGA = %w[ hundred thousand million billion ]

  def initialize( number )
    unless number.is_a? Integer
      raise ArgumentError.new( 'Only integers are supported, yet.' )
    end
    super number
  end

  def to_s
    convert
  end

  protected
  def convert
    original = __getobj__.to_s
    trios = original.reverse\
                    .split(//)\
                    .in_groups_of(3)\
                    .collect{|e| e.reverse.join.to_i}\
                    .reverse
    trios.collect { |e| convert_trio e }.join ' '
  end

  def convert_trio( val )
    if val < 10
      ONES[ val ]
    elsif val < 20
      TEEN[ val - 10 ]
    elsif val < 100
      q, r = val/10, val%10
      TENS[ q ] + ( !r.zero? ? '-' + convert_trio( r ) : '' )
    else
      q, r = val/100, val%100
      ONES[ q ] + ( !r.zero? ? ' hundred and ' + convert_trio( r ) : '' )
    end
  end

end
