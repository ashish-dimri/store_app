class OrderItem < ApplicationRecord
	belongs_to :order, inverse_of: :order_items
  belongs_to :item, inverse_of: :order_items

  before_save :set_unit_price
  before_save :set_total
  after_create :reduce_item_quantity_create
  before_update :reduce_item_quantity
  after_destroy :update_item_quantity

  def unit_price
    # If there is a record
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total
    unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self.total = total * quantity
  end

  def reduce_item_quantity_create
    item.quantity = item.quantity - quantity
    item.save
  end

  def reduce_item_quantity
    if order.order_items.find(self.id).quantity > self.quantity
      item.quantity = item.quantity + (order.order_items.find(self.id).quantity - self.quantity)
    else
      item.quantity = item.quantity - (self.quantity - order.order_items.find(self.id).quantity)
    end
    item.save
  end

  def update_item_quantity
    item.quantity = item.quantity + self.quantity
    item.save
  end
end
