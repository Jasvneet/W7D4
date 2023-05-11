# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :text
#  content    :text
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true 

    validates :subs

    belongs_to :author


    has_many :post_subs,
        foreign_key: :post_id, 
        class_name: :PostSub

    has_many :subs, 
        through: :post_subs, 
        source: :sub



    



end
