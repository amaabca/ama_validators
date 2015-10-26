# Use this with
# validates :your_province_field, province: { country: :your_country_field }

class ProvinceValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    provinces = PROV_STATE[object.send(options[:country]).to_sym]
    if provinces.present? && !provinces.include?(value)
      object.errors[attribute] << (options[:message] || 'Province/State should be in selected country.')
    end
  end

  COUNTRIES = { canada: 'Canada', usa: 'United States of America', mexico: 'Mexico' }

  PROV_STATE = {
      canada: ['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland', 'Nova Scotia',
               'Northwest Territories', 'Nunavut', 'Ontario', 'Prince Edward Island', 'Saskatchewan',
               'Quebec', 'Yukon'],
      usa: ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware',
            'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky',
            'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi',
            'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico',
            'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania',
            'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
            'Virginia', 'Washington', 'Washington, D.C', 'West Virginia', 'Wisconsin', 'Wyoming']
  }
end
