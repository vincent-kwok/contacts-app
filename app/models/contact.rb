class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :bio, length: { maximum: 250 }

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def friendly_updated_at
    updated_at.strftime("%B %e, %Y")
  end

  def full_name
    if middle_name
      full_name = "#{first_name} #{middle_name} #{last_name}"
    else
      full_name = "#{first_name} #{last_name}"
    end
  end

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: japan_friendly,
      bio: bio,
      created_at: friendly_created_at,
      updated_at: friendly_updated_at
    }
  end

  def japan_friendly
    "+81 #{phone_number}"
  end

end