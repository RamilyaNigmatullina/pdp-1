require "rails_helper"

describe Orders::Save do
  let(:product1) { create :product }
  let(:product2) { create :product }
  let(:warehouse) { create :warehouse }

  let(:warehouse_product) { double }

  let(:order) { build :order, product: product1, warehouse: warehouse, amount: 15 }

  describe ".call" do
    subject(:result) { described_class.call(order: order) }

    context "when product amount enough in warehouse" do
      before do
        allow(WarehouseProduct).to receive(:find_by).and_return(warehouse_product)
        allow(warehouse_product).to receive(:amount).and_return(20)
        allow(warehouse_product).to receive(:update).and_return(true)
      end

      it { expect { result }.to change { Order.count }.by(1) }
    end

    context "when product amount not enough in warehouse" do
      before do
        allow(WarehouseProduct).to receive(:find_by).and_return(warehouse_product)
        allow(warehouse_product).to receive(:amount).and_return(10)
      end

      it { expect { result }.not_to change { Order.count } }
    end
  end
end
