require 'active_record'
require 'protected_attributes'

class OpenidAbstract < ActiveRecord::Base
  self.abstract_class = true
end
