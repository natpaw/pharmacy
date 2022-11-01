require 'rails_helper'

describe OrderedMedicine do
	
	it { should validate_presence_of(:quantity) }

	it { should validate_numericality_of(:quantity).only_integer}
	
	it { should allow_values('РЛ159214', 'РЛ000000').for(:presc_number) }
	
	it { should belong_to(:order) }

	it { should have_one(:prescription) }
	
	it { should belong_to(:medicine) }

end 