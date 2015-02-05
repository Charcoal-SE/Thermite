class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @site = Site.find(params["id"])
    @comments = Comment.find_all_by_site_and_is_flagged_and_is_handled(@site.id, true, false).sort_by { |c| c.creation_date }.reverse.first(100)

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

  def markValid
    comment = Comment.find(params[:id])
    if !comment.is_flagged
      render :text => "You attempted to handle a comment that hasn't been flagged" and return
    elsif FlagHandlings.find_by_comment_id(comment.id)
      render :text => "This flag has already been handled" and return
    end

    handling = FlagHandlings.new
    handling.user_id = current_user.id
    handling.comment_id = comment.id
    handling.result_id = 1

    comment.is_handled = true

    if handling.save! and comment.save!
      render :text => "success" and return
    else
      render :text => "error" and return
    end
  end
  def markInvalid
    comment = Comment.find(params[:id])
    if !comment.is_flagged
      render :text => "You attempted to handle a comment that hasn't been flagged" and return
    elsif FlagHandlings.find_by_comment_id(comment.id)
      render :text => "This flag has already been handled" and return
    end

    handling = FlagHandlings.new
    handling.user_id = current_user.id
    handling.comment_id = comment.id
    handling.result_id = 2

    comment.is_handled = true

    if handling.save! and comment.save!
      render :text => "success" and return
    else
      render :text => "error" and return
    end
  end
  def markDeleted
    comment = Comment.find(params[:id])
    if !comment.is_flagged
      render :text => "You attempted to handle a comment that hasn't been flagged" and return
    elsif FlagHandlings.find_by_comment_id(comment.id)
      render :text => "This flag has already been handled" and return
    end

    handling = FlagHandlings.new
    handling.user_id = current_user.id
    handling.comment_id = comment.id
    handling.result_id = 3

    comment.is_handled = true

    if handling.save! and comment.save!
      render :text => "success" and return
    else
      render :text => "error" and return
    end
  end
end
