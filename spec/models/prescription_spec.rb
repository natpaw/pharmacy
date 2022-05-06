require 'rails_helper'

describe Prescription do

	it { should validate_presence_of(:number) }
	
	it { should validate_presence_of(:quantity) }
	
	it { should validate_presence_of(:exp_date) }
	
	it { should validate_numericality_of(:quantity).only_integer }
	
	it { should allow_values('РЛ159214', 'РЛ000000').for(:number) }
	
	it { should_not allow_values('0', 'НМ000000', 'НМ').for(:number) }

	it { should belong_to(:doctor) }

	it { should belong_to(:medicine) }

end 