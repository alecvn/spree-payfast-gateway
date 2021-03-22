class Spree::PayFastPaymentSource < Spree::Base
  belongs_to :payment_method
  has_many :payments, as: :source

  EFT        = 'eft'
  CREDITCARD = 'cc'
  DEBITCARD  = 'dc'
  MASTERPASS = 'mp'
  MOBICRED   = 'mc'
  SCODE      = 'sc'

  def actions
    []
  end

  def transaction_id
    payment_id
  end

  def method_type
    'pay_fast_payment_source'
  end

  def display_name
    case name
    when ::Spree::PayFastPaymentSource::EFT then
      'EFT'
    when ::Spree::PayFastPaymentSource::CREDITCARD then
      'Credit card'
    when ::Spree::PayFastPaymentSource::DEBITCARD then
      'Debit card'
    when ::Spree::PayFastPaymentSource::MASTERPASS then
      'Snapscan'
    when ::Spree::PayFastPaymentSource::MOBICRED then
      'Mobicred'
    when ::Spree::PayFastPaymentSource::SCODE then
      'Scode'
    else
      'PayFast (Unknown method)'
    end
  end
end
