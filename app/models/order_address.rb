class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/,
                            message: "Input correctly"} do
      validates :postal_code
    end
    with_options format: {with: /\A[0-9]{11}\z/,
                            message: 'number Input only number' } do
      validates :phone
    end
  end

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone: phone, order_id: order.id)
  end

end