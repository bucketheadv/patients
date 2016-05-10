class Patient < ActiveRecord::Base
  class << self 
    def avaliable_genders 
      I18n.t("field_genders")
    end

    def avaliable_statuses 
      I18n.t("field_statuses")
    end
  end
  MAX_ID_LENGTH = 6
  validates_presence_of :first_name, :last_name, :status_id, :location_id
  validates_inclusion_of :status_id, in: 0...avaliable_statuses.count
  validates_inclusion_of :gender_id, in: 0...avaliable_genders.count
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
    self.class.avaliable_genders[self.gender_id]
  end

  def status 
    self.class.avaliable_statuses[self.status_id]
  end

  def viewed_count_up
    self.update_attributes(viewed_count: self.viewed_count + 1)
  end
end
