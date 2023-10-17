# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  validates :name,
            format: { with: /\A[a-zA-Z0-9]+\z/, message: 'アルファベットと数字だけが使用できます' },
            presence: true
end
