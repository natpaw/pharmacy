require 'rails_helper'

describe Pharmacist do

	it { should validate_presence_of(:first_name) }

	it { should validate_presence_of(:last_name) }

	it { should have_many(:orders) }

end 