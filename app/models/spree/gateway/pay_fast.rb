class Spree::Gateway::PayFast < Spree::Gateway

  def provider_class
    Spree::Gateway::PayFast
  end

  # def payment_source_class
  #   Spree::PayFastPaymentSource
  # end

  def method_type
    'pay_fast'
  end

  def source_required?
    false
  end

  def process(amount, source, gateway_options)
    ActiveMerchant::Billing::Response.new(true, 'Payment completed')
  end

  def capture()

  end

  # def supports?(_source)
  #   # the source for authorizations is going to be a credit card
  #   # TODO need to do a check whether the credit card is supported
  #   true
  # end

end
