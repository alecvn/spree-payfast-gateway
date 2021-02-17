class Spree::PayFastController < Spree::BaseController

  protect_from_forgery except: :update

  # Example: PayFast payment
  # {
  #   "m_payment_id"=>"",
  #   "pf_payment_id"=>"1291711",
  #   "payment_status"=>"COMPLETE",
  #   "item_name"=>"Test Product",
  #   "item_description"=>"",
  #   "amount_gross"=>"100.00",
  #   "amount_fee"=>"-2.30",
  #   "amount_net"=>"97.70",
  #   "custom_str1"=>"",
  #   "custom_str2"=>"",
  #   "custom_str3"=>"",
  #   "custom_str4"=>"",
  #   "custom_str5"=>"",
  #   "custom_int1"=>"5",
  #   "custom_int2"=>"",
  #   "custom_int3"=>"",
  #   "custom_int4"=>"",
  #   "custom_int5"=>"",
  #   "name_first"=>"",
  #   "name_last"=>"",
  #   "email_address"=>"",
  #   "merchant_id"=>"10020921",
  #   "signature"=>"67b2a7528008955a8e3c4e3fd71c24f3",
  #   "controller"=>"spree/pay_fast",
  #   "action"=>"update",
  #   "state"=>"payment"
  # }
  def update
    order = Spree::Order.find(params[:custom_int1])

    if payment_params_valid? && paying_with_payfast?
      if order.update_from_params(params, permitted_checkout_attributes, request.headers.env)
        order.payments.create!(amount: params[:amount_gross], payment_method_id: 7, state: 'completed')
        order.reload
        order.next

        head :ok
      else
        head :bad_request
      end
    end
  end

  def validate_payment
  end

  private

  def payment_method_id_param
    params[:order][:payments_attributes].first[:payment_method_id]
  end

  def paying_with_payfast?
    # payment_method = PaymentMethod.find(payment_method_id_param)
    # payment_method.is_a? Spree::Gateway::PayFast
    true
  end

  def payment_params_valid?
    #(params[:state] === 'payment')# && params[:order][:payments_attributes]
    true
  end

end
