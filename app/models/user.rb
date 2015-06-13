class User < ActiveRecord::Base
  STATES = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Conneticut",
    "Deleware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"
  ]

  ANIMAL_TYPES = [
    "dog",
    "cat",
    "panda",
    "dragon",
    "pig",
    "hedgehog",
    "sea otter",
    "bear",
    "rabbit",
    "bird",
    "giraffe",
    "elephant",
    "hippo",
    "deer",
    "koala",
    "other"
  ]

  validates :username,
            :password_digest,
            :session_token,
            :gender,
            :birthdate,
            :city,
            :state,
            :animal_type,
            presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :gender, inclusion: { in: ["M", "F"], message: "Must be M or F" }
  validates :state, inclusion: { in: STATES, message: "Must be in the U.S." }
  validates :animal_type,
            inclusion: { in: ANIMAL_TYPES, message: "Must be one of the listed types" }

  has_many :hobbyings, dependent: :destroy
  has_many :hobbies, through: :hobbyings

  has_many :pictures, dependent: :destroy

  has_many :given_votes, class_name: "Vote", foreign_key: :voter_id
  has_many :received_votes, class_name: "Vote", foreign_key: :votee_id

  after_initialize :set_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)

    user && user.is_password?(password) ? user : nil
  end

  attr_reader :password

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!

    self.session_token
  end

  def set_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def rating
    rating = Vote.where(votee_id: self.id).average(:value).to_f

    (rating * 10).round(2)
  end

  def vote_by_user(user)
    Vote.where(voter_id: user.id, votee_id: self.id).pluck(:value)[0]
  end

  def fans
    User.joins(:received_votes).where(votes: { votee_id: self.id, value: 1 })
  end

  def cuted_by_user?(user)
    !!self.received_votes.where(value: 1).find_by(voter_id: user.id)
  end

  def booted_by_user?(user)
    !!self.received_votes.where(value: 0).find_by(voter_id: user.id)
  end

  # liked_by_current_user && fan
  def connected?
  end
end
