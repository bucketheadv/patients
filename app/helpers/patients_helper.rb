module PatientsHelper
  def genders_values
    Patient::AVALIABLE_GENDERS.each_with_index.map { |name, idx| [name, idx]}[1..-1]
  end

  def statuses_values
    Patient::AVALIABLE_STATUSES.each_with_index.map { |name, idx| [name, idx]}
  end
end
