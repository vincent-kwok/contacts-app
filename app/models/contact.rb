class Contact < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B%e, %Y")
  end

  def friendly_updated_at
    updated_at.strftime("%B%e, %Y")
  end

  def full_name
    full_name = "#{first_name} #{last_name}"
  end

  def as_json
    {
      id: id,
      first_name: first_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: japan_friendly,
      created_at: friendly_created_at,
      updated_at: friendly_updated_at
    }
  end

  def japan_friendly
    "+81 #{phone_number}"
  end

end