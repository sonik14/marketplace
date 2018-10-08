class FunctionG < ApplicationRecord
  belongs_to :game
  belongs_to :function_usage
  belongs_to :function, optional: true

  validates :game, uniqueness: {scope: :function_usage}, presence: true

  validates :parA, numericality: true, format: { with: /\A\d+(?:\.\d{1,2})?\z/ }, allow_nil: true
  validates :parB, numericality: true, format: { with: /\A\d+(?:\.\d{1,2})?\z/ }, allow_nil: true
  validates :parC, numericality: true, format: { with: /\A\d+(?:\.\d{1,2})?\z/ }, allow_nil: true
  validates :parD, numericality: true, format: { with: /\A\d+(?:\.\d{1,2})?\z/ }, allow_nil: true

  include ApplicationHelper
  before_update :check_function_params
end
