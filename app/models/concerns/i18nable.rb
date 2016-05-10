module Concerns
  module I18nable
    extend ActiveSupport::Concern

    included do 
      Kernel.send(:include, ClassMethods)
    end
    module ClassMethods 
      # delegate :translate, to: "I18n.t"
      def translate(*args)
        I18n.t(*args)
      end
    end
  end
end
