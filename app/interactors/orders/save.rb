module Orders
  class Save
    include Interactor

    delegate :order, to: :context

    def call
      order.valid? ? create_order : context.fail!
    end

    private

    def create_order
      order.save
      reduce_amount_in_warehouse
    end

    def reduce_amount_in_warehouse
      order.warehouse.remove(order.product, order.amount)
    end
  end
end
