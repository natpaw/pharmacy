require 'rails_helper'

describe Doctor do

	
	it { should have_many(:prescriptions) }
	
	it { should belong_to(:user) }
	
end 