class Spree::Gateway::PayFast < Spree::Gateway

  preference :merchant_id, :string
  preference :merchant_key, :string
  preference :return_url, :string
  preference :cancel_url, :string
  preference :notify_url, :string
  preference :payfast_api, :string
  preference :payfast_test_api, :string

  OPTIONS = {
    EFT: 'eft',
    CREDITCARD: 'cc',
    DEBITCARD: 'dc',
    MASTERPASS: 'mp',
    MOBICRED: 'mc',
    SCODE: 'sc'
  }

  def provider_class
    Spree::Gateway::PayFast
  end

  def payment_source_class
    Spree::PayFastPaymentSource
  end

  def method_type
    'pay_fast'
  end

  def source_required?
    false
  end

  def process(amount, source, gateway_options)
    ActiveMerchant::Billing::Response.new(true, 'Payment completed')
  end

  def authorize(amount, order, payment_method_id, source_id)
  end

  def capture()

  end

  # def supports?(_source)
  #   # the source for authorizations is going to be a credit card
  #   # TODO need to do a check whether the credit card is supported
  #   true
  # end

end
