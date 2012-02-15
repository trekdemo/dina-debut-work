When /^I present (\d+) as english number$/ do |number|
  @word = EnglishNumber.new( number.to_i ).to_s
end

Then /^I should get "([^\"]*)"$/ do |expectation|
  @word.should eql( expectation )
end

