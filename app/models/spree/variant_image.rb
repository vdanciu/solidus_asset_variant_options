# frozen_string_literal: true

module Spree
  class VariantImage < ApplicationRecord
    self.table_name = :spree_assets_variants
    belongs_to :image, class_name: 'Spree::Image'
    belongs_to :variant, class_name: 'Spree::Variant', touch: true

    # on create only just in case there are some lingering in the system
    validates :image_id, uniqueness: { scope: :variant_id, on: :create }
  end
end
