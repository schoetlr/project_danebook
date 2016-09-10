require 'active_support/concern'

module DateWriter
  extend ActiveSupport::Concern

  
  def date
    created_at.strftime("%B %d, %y")
  end

end