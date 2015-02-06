class HistoryController < ApplicationController
  def index
    @recent_flags = FlagHandlings.order(:created_at).first(100)
  end
end
