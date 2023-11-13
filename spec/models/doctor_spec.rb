require 'rails_helper'

RSpec.describe Doctor do

  before :each do
    test_data
  end

  describe '#Relationships' do
    it {should belong_to :hospital}
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe '#self.sort_doctors' do
    it 'returns the list of doctors in order of patients seen' do
      sort_doc = [@meredith, @mark, @alex, @cristina, @derek]
      expect(Doctor.sort_doctors.to_a).to eq(sort_doc)
    end
  end

  describe '#patient_count' do
    it 'will count the amount of patients for this doctor' do
      expect(@meredith.patient_count).to eq(5)
    end
  end

end