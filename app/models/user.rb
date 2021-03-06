include CarrierWave::Validations::ActiveModel
class User < ApplicationRecord


  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates_processing_of :image
  validate :image_size_validation

  validates :pass, confirmation: true
  validates :pass_confirmation, presence: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates_presence_of :first_name, :last_name, :email, :pass, :birth_date, :gender, :city
  validates_uniqueness_of :email

  belongs_to :city, :class_name => 'City', inverse_of: 'users', :foreign_key => 'city_id'

  #has_many :previa_groups_users
  #has_many :previa_groups, through: :previa_groups_users, :class_name => 'PreviaGroup'
  has_and_belongs_to_many :previa_groups, :class_name=>'PreviaGroup', :join_table => 'previa_groups_users', :foreign_key => 'user_id', :association_foreign_key => 'previa_group_id'
  #has_and_belongs_to_many :previa_groups

  #has_many :user_invitations
  #has_many :invitations, through: :user_invitations, :class_name => 'PreviaGroup'
  has_and_belongs_to_many :invitations, :class_name=>'PreviaGroup', :join_table => 'user_invitations', :foreign_key => 'user_id', :association_foreign_key => 'previa_group_id'

  #has_many :user_bans
  #has_many :banned_groups, through: :user_bans, :class_name => 'PreviaGroup'
  has_and_belongs_to_many :banned_groups, :class_name=>'PreviaGroup', :join_table => 'user_bans', :foreign_key => 'user_id', :association_foreign_key => 'previa_group_id'
  
  has_many :notifications

  GENDER_TYPES = ["Masculino", "Femenino"]

  def age
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  private
    def image_size_validation
      errors[:image] << "El tamaño del archivo debe ser menor que 500KB" if image.size > 0.5.megabytes
    end

end