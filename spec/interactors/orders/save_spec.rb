require "rails_helper"

describe Orders::Save do
  let(:product1) { create :product }
  let(:product2) { create :product }
  let(:warehouse) { create :warehouse }
  let(:order) { build :order, product: product1, warehouse: warehouse, amount: 15 }

  describe ".call" do
    subject(:result) { described_class.call(order: order) }

    context "when product amount enough in warehouse" do
      let!(:warehouse_product) { create :warehouse_product, warehouse: warehouse, product: product1, amount: 20 }

      it { expect { result }.to change { Order.count }.by(1) }
      it { expect { result }.to change { warehouse_product.reload.amount }.from(20).to(5) }
    end

    context "when product amount not enough in warehouse" do
      let!(:warehouse_product) { create :warehouse_product, warehouse: warehouse, product: product1, amount: 10 }

      it { expect { result }.not_to change { Order.count } }
      it { expect { result }.not_to change { warehouse_product.reload.amount } }
    end
  end
end
