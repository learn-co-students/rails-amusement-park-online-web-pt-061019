class AttractionController < ApplicationController
  has_many :rides
  has_many :users, through: :rides
end
