class CreateSpreePayFastPaymentSources < SpreeExtension::Migration[4.2]
  def change
    create_table :spree_pay_fast_payment_sources do |t|
      t.string  :pf_payment_id
      t.string  :name
      t.string  :fee
      t.string  :signature
      t.integer :payment_method_id
      t.boolean :validated, default: false
    end
  end
end
