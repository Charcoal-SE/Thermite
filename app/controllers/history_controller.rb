class HistoryController < ApplicationController
  def index
    @recent_flags = FlagHandlings.last(100)
  end
end
