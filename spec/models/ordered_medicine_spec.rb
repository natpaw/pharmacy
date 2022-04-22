require 'rails_helper'

describe OrderedMedicine do
	
	it { should validate_presence_of(:quantity) }

	it { should validate_numericality_of(:quantity).only_integer}
	
	it { should allow_values('РЛ159214', 'РЛ000000').for(:presc_number) }
	
	it { should_not allow_values('0', 'НМ000000', 'НМ').for(:presc_number) }
	
	it { should belong_to(:order) }

	it { should belong_to(:prescription) }
	
	it { should belong_to(:medicine) }

end 