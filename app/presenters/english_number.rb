class EnglishNumber < SimpleDelegator

  ONES = %w[ zero one two three four five six seven eight nine ]
  TEEN = %w[ ten eleven twelve thirteen fourteen fifteen sixteen seventeen
             eighteen nineteen ]
  TENS = %w[ zero ten twenty thirty forty fifty sixty seventy eighty ninety ]
  MEGA = [''] + %w[ thousand million billion trillion quadrillion
             quintillion sextillion septillion octillion nonillion decillion
             undecillion duodecillion tredecillion quattuordecillion
             quindecillion sexdecillion septdecillion novemdecillion
             vigintillion unvigintillion duovigintillion trevigintillion
             quattuorvigintillion quinvigintillion sexvigintillion
             septvigintillion octovigintillion novemvigintillion trigintillion
             untregintillion duotrigintillion googol ]

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
  # Convert numbers to english words
  def convert
    original      = __getobj__.to_s

    unless irregular_number?( __getobj__ )
      # Split up the number into triplets
      trios_reverse = create_reversed_grouped_numbers( original )

      # Generate the number based on the triplets
      multi_triplet = trios_reverse.length > 1
      result        = []
      trios_reverse.each_with_index do |e, factor|
        result << (convert_triplet( e, factor, multi_triplet ) + ' ' + MEGA[factor]).strip
      end

      # And finaly join the triplets in the correct order
      result.reverse.join ' '
    else
      convert_irregular_number( original )
    end
  end

  # Convert numbers between 0-999 to english words
  def convert_triplet( num, factor = 0, multi_triplet = false )
    # Caseses below 100
    result = ( factor.zero? and multi_triplet ) ? ' and ' : ''
    case num
    when 0..9   then result += ONES[ num ]
    when 10..19 then result += TEEN[ num - 10 ]
    when 20..99
      q, r = num/10, num%10
      result += "#{TENS[ q ]}#{ '-' + ONES[ r ] unless r.zero? }"

    # Casees between 100-999
    else
      q, r = num/100, num%100
      result  = ( !multi_triplet and num == 100 ) ? '' : ONES[q]
      result += if !r.zero?
                  ' hundred and ' + convert_triplet( r, factor )
                else
                  ' hundred'
                end
    end
    result
  end

  # Handle irregular numbers
  def irregular_number?( num )
    (1200..1999).include? num
  end

  def convert_irregular_number( num )
    duos_reverse = create_reversed_grouped_numbers( num, 2 )
    result = []
    duos_reverse.each_with_index do |e, factor|
      result << convert_triplet( e, factor, false)
    end
    result.reverse.join ' hundred and '
  end

  private
  def create_reversed_grouped_numbers( number, grouping = 3 )
    number.reverse\
          .split(//)\
          .in_groups_of( grouping )\
          .collect{|e| e.reverse.join.to_i}
  end
end
