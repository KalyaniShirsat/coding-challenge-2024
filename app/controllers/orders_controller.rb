class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = current_user.is_doctor ? current_user.doctor_orders : current_user.orders
    puts "Orders: #{@orders.inspect}"
  end

  # GET /orders/1 or /orders/1.json
  def show
  end
end
