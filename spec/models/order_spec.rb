require 'rails_helper'

describe Order do

	it { should validate_presence_of(:status) }

	it { should validate_presence_of(:total) }

	it { should belong_to(:pharmacist) }
	
	it { should belong_to(:user) }

end 