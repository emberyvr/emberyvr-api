class Api::V1::UserResource < BaseResource
  attributes  :name,
              :avatar,
              :authentication_token,
              :created_at,
              :email,
              :password,
              :path_name,
              :new_password,
              :role,
              :updated_at

  has_many :interpretations
  has_many :spiritual_event_scenes
  has_many :spiritual_events
  has_one :profile

  filters :email,
          :path_name

  def creatable_fields(context)
    super - [:profile_id]
  end

  def updatable_fields(context)
    super - [:profile_id]
  end

  def new_password
    # Stubbed out to allow receiving it
  end
end
