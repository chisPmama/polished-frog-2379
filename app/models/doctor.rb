class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def self.sort_doctors
    Doctor.select('doctors.*, COUNT(patients.id) AS patient_count')
          .joins(:patients)
          .group('doctors.id')
          .order('patient_count DESC')
  end

  def patient_count
    patients.count
  end

end