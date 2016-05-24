class PagesController < ApplicationController
  expose(:page, attributes: :page_params)
  expose(:policy) { Policy.new(current_user, page) }
  def index
    @pages=Page.all
  end

  def new
  end

  def edit

  end

  def home
  end

  def create
    page.user = current_user
    page.save

    respond_with page
  end

  def show
  end

  def update
    page.save
    respond_with page, location: pages_path
  end

  def destroy
    page.destroy
    respond_with page, location: pages_path
  end

  def page_params
    params.require(:page).permit(:title, :body, :position)
  end
end
