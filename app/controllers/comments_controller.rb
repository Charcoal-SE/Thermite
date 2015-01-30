class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @site = Site.find(params["id"])
    @comments = Comment.find_all_by_site_and_is_flagged(@site.id, true).first(100)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
end
