class ConversionController < ApplicationController

  def index
    @number         = nil
    @english_number = nil
    if params[:number].present?
      @number = params[:number].to_i
      @english_number = EnglishNumber.new( @number )
    end
  end

end
