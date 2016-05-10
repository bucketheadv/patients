module PatientsHelper
  def genders_values
    Patient::AVALIABLE_GENDERS.each_with_index.map { |name, idx| [name, idx]}[1..-1]
  end

  def location_values
    Rails.cache.fetch("location_ids", expires_in: 10.minutes) do
      Location.select([:id, :name]).map { |loc| [loc.name, loc.id] }
    end
  end

  def statuses_values
    Patient::AVALIABLE_STATUSES.each_with_index.map { |name, idx| [name, idx]}
  end
end
