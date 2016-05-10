class Patient < ActiveRecord::Base
  AVALIABLE_GENDERS  = I18n.t("field_genders")
  AVALIABLE_STATUSES = I18n.t("field_statuses")
  MAX_ID_LENGTH = 6
  validates_presence_of :first_name, :last_name, :status_id, :location_id
  validates_inclusion_of :status_id, in: 0...AVALIABLE_STATUSES.count
  validates_inclusion_of :gender_id, in: 0...AVALIABLE_GENDERS.count
  validates_length_of :first_name, maximum: 30
  validates_length_of :middle_name, maximum: 10
  validates_length_of :last_name, maximum: 30
  delegate :name, to: "location", prefix: 'location', allow_nil: true

  belongs_to :location
  scope :onTreatment, -> { where(status_id: 2) }
  scope :not_deleted, -> { where(deleted: false) }

  def full_name
    "#{self.first_name}, #{[self.last_name, self.middle_name].join(" ")}"
  end

  def age
    if self.birthday.present?
      Date.today.year - self.birthday.year
    end
  end

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
