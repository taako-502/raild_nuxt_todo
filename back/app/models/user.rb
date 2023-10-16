# frozen_string_literal: true

class User < ApplicationRecord
  validates :name,
            format: { with: /\A[a-zA-Z0-9]+\z/, message: 'アルファベットと数字だけが使用できます' },
            presence: true
end
