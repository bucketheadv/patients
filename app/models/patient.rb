class Patient < ActiveRecord::Base
  AVALIABLE_GENDERS  = I18n.t("field_genders")
  AVALIABLE_STATUSES = I18n.t("field_statuses")
  MAX_ID_LENGTH = 6
  belongs_to :location
  validates_presence_of :first_name, :last_name, :status_id, :location_id
  validates_inclusion_of :status_id, in: 0..AVALIABLE_STATUSES.count
  validates_inclusion_of :gender_id, in: 0..AVALIABLE_GENDERS.count

  scope :onTreatment, -> { where(status_id: 2) }

  def mr_number 
    need_length = MAX_ID_LENGTH - self.id.to_s.length
    if need_length > 0
      "MR#{"0" * need_length}#{self.id}"
    else
      "MR#{self.id}"
    end
  end

  def gender 
    AVALIABLE_GENDERS[self.gender_id]
  end

  def status 
    AVALIABLE_STATUSES[self.status_id]
  end

  def viewed_count_up
    self.update_attributes(viewed_count: self.viewed_count + 1)
  end
end
