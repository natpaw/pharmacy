require 'rails_helper'

describe Doctor do

	it { should validate_presence_of(:first_name) }
	
	it { should validate_presence_of(:last_name) }
	
	it { should validate_presence_of(:email) }
	
	it { should have_many(:prescriptions) }
	
	
end 