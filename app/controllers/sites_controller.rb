class SitesController < ApplicationController
  before_filter :authenticate_user!

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.find_all_by_get_comments(true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end
end
