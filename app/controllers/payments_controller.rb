class PaymentsController < ApplicationController
  protect_from_forgery except: :update

  before_action :load_order, only: :create
  before_action :load_payment, only: :show

  def create
    @payment = Payment.new name: current_user.name,
      order_id: @order.id, price: @order.total_paid
    if @payment.save
      redirect_to @payment.paypal_url(payment_path(@payment))
    else
      flash[:danger] = t ".errors.load"
      redirect_to booking_histories_path
    end
  end

  def show
  end

  def update
    status = params[:payment_status]
    if status == Settings.complete_payment_status
      @payment = Payment.find_by id: params[:invoice]
      if @payment.update_attributes notification_params: params.permit!,
        status: status, transaction_id: params[:txn_id], purchased_at: Time.now
        flash[:success] = t "payment.success.update"
        @order = Order.find_by id: @payment.order_id
        @order.update_attributes status: Order.statuses[:paid]
      else
        flash[:danger] = t "payment.errors.update"
      end
    end
  end

  private

  def transaction_params
    params.permit stat
  end

  def load_order
    @order = Order.find_by id: params[:order]
    if @order.nil?
      flash[:danger] = t "orders.errors.load"
      redirect_to booking_histories_path
    end
  end

  def load_payment
    @payment = Payment.find_by id: params[:id]
    if @payment.nil?
      flash[:danger] = t "payments.errors.load"
      redirect_to booking_histories_path
    end
  end
end
