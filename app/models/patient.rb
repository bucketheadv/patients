class Patient < ActiveRecord::Base
  include Concerns::I18nable
  AVALIABLE_GENDERS  = translate("field_genders") #["Not Avaliable", "Male", "Female"]
  AVALIABLE_STATUSES = translate("field_statuses") #["Initial", "Referred", "Treatment", "Closed"]
  MAX_ID_LENGTH = 6
  belongs_to :location
  validates_presence_of :first_name, :last_name, :status_id, :location_id
  validates_inclusion_of :status_id, in: 0..AVALIABLE_STATUSES.count
  validates_inclusion_of :gender_id, in: 0..AVALIABLE_GENDERS.count

  scope :onTreatment, -> { where(status_id: 2) }

  def mr_number 
    id_length = self.id.to_s.length
    if id_length < MAX_ID_LENGTH
      "MR#{"0" * (MAX_ID_LENGTH - id_length)}#{self.id}"
    else
      "MR#{self.id}"
    end
  end

  def viewed_count_up
    self.update_attributes(viewed_count: self.viewed_count + 1)
  end
end
