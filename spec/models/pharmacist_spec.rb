require 'rails_helper'

describe Pharmacist do

	it { should have_many(:orders) }
	
	it { should belong_to(:user) }

end 