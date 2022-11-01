require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/ordered_medicines", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # OrderedMedicine. As you add validations to OrderedMedicine, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create(:user)}
  let(:medicine) { FactoryBot.create(:medicine)}
  let(:pharmacist) { FactoryBot.create(:pharmacist) }
  let(:order) { create :order, user_id: user.id, pharmacist_id: pharmacist.id }
  
  let(:valid_attributes) {
     FactoryBot.attributes_for(:ordered_medicine, order_id: order.id, medicine_id: medicine.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:ordered_medicine, order_id: order.id, medicine_id: medicine.id, quantity: 'a')
  }

  describe "GET /index" do
    it "renders a successful response" do
      OrderedMedicine.create! valid_attributes
	  sign_in user
      get order_ordered_medicines_url(order_id: order.id)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ordered_medicine = OrderedMedicine.create! valid_attributes
	  sign_in user
      get order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
	  sign_in user
      get new_order_ordered_medicine_url(order_id: order.id)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
	  sign_in user
      ordered_medicine = OrderedMedicine.create! valid_attributes
	  
      get edit_order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new OrderedMedicine" do
		sign_in user
        expect {
          post order_ordered_medicines_url(order_id: order.id), params: { ordered_medicine: valid_attributes }
        }.to change(OrderedMedicine, :count).by(1)
      end

      it "redirects to the created ordered_medicine" do
		sign_in user
        post order_ordered_medicines_url(order_id: order.id), params: { ordered_medicine: valid_attributes }
		ordered_medicine = OrderedMedicine.last
        expect(response).to redirect_to(edit_order_url(id: order.id))
      end
    end

    context "with invalid parameters" do
      it "does not create a new OrderedMedicine" do
	    sign_in user
        expect {
          post order_ordered_medicines_url(order_id: order.id), params: { ordered_medicine: invalid_attributes }
        }.to change(OrderedMedicine, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
	    sign_in user
        post order_ordered_medicines_url(order_id: order.id), params: { ordered_medicine: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
	  let(:new_medicine) { FactoryBot.create(:medicine)}
      let(:new_attributes) {
        FactoryBot.attributes_for(:ordered_medicine, order_id: order.id, medicine_id: new_medicine.id)
      }

      it "updates the requested ordered_medicine" do
        ordered_medicine = OrderedMedicine.create! valid_attributes
		sign_in user
        patch order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id), params: { ordered_medicine: new_attributes }
        ordered_medicine.reload
        expect(assigns(:ordered_medicine).attributes['medicine_id']).to match(new_medicine.id)
      end

      it "redirects to the ordered_medicine" do
        ordered_medicine = OrderedMedicine.create! valid_attributes
		sign_in user
        patch order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id), params: { ordered_medicine: new_attributes }
        ordered_medicine.reload
        expect(response).to redirect_to(edit_order_url(id: order.id))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        ordered_medicine = OrderedMedicine.create! valid_attributes
		sign_in user
        patch order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id), params: { ordered_medicine: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ordered_medicine" do
      ordered_medicine = OrderedMedicine.create! valid_attributes
	  sign_in user
      expect {
        delete order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id)
      }.to change(OrderedMedicine, :count).by(-1)
    end

    it "redirects to the ordered_medicines list" do
      ordered_medicine = OrderedMedicine.create! valid_attributes
	  sign_in user
      delete order_ordered_medicine_url(order_id: order.id, id: ordered_medicine.id)
      expect(response).to redirect_to(edit_order_url(id: order.id))
    end
  end
end
