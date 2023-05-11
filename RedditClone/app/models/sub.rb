# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :moderator_id, presence: true 
  
    belongs_to :moderator


    has_many :post_subs,
        foreign_key: :sub_id, 
        class_name: :PostSub

    has_many :posts, 
        through: :post_subs, 
        source: :post



end
