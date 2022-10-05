# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  before_validation :set_slug

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :slug, uniqueness: true

  private

  def set_slug
    self.slug = title.tr('_', '-').parameterize
  end
end