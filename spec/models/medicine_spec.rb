require 'rails_helper'

describe Medicine do

	it { should validate_presence_of(:name) }

	it { should validate_presence_of(:price) }
	
	it { should validate_presence_of(:quantity) }
	
	it { should validate_uniqueness_of(:name) }
	
	it { should validate_numericality_of(:quantity)}
	
	it { should validate_numericality_of(:price)}

	it { should have_many(:prescriptions) }
	
	it { should have_many(:ordered_medicines) }

end 