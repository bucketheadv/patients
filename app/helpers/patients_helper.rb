module PatientsHelper
  def genders_values
    Patient.avaliable_genders.each_with_index.map { |name, idx| [name, idx]}[1..-1]
  end

  def location_values
    Location.select([:id, :name]).map { |loc| [loc.name, loc.id] }
  end

  def statuses_values
    Patient.avaliable_statuses.each_with_index.map { |name, idx| [name, idx]}
  end
end
