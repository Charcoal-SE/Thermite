class HistoryController < ApplicationController
  def index
    @recent_flags = FlagHandlings.order(created_at: :asc).first(100)
  end
end
