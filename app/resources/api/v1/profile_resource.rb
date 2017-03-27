class Api::V1::ProfileResource < BaseResource
  attributes  :first_name,
              :last_name,
              :full_name,
              :gender

  has_one :user

  def creatable_fields(context)
    super - [:user_id]
  end

  def updatable_fields(context)
    super - [:user_id]
  end
end
