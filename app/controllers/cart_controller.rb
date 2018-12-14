class CartController < ApplicationController
  before_action :authenticate_user!
  def cart
    @new_orders = User.where(id: current_user.id).take.orders.where(completed: false)
    @old_orders = User.where(id: current_user.id).take.orders.where(completed: true)
  end

  def order
    @new_orders = User.where(id: current_user.id).take.orders.where(completed: false)
    @new_orders.each do |order|
      order.completed = true
      order.save
    end
  end
end
