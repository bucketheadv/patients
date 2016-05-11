module Concerns
  module I18nable
    extend ActiveSupport::Concern
    included do 
      class << self 
        def avaliable_genders 
          I18n.t("field_genders")
        end

        def avaliable_statuses 
          I18n.t("field_statuses")
        end
      end
    end
  end
end
