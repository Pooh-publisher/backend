class StaticPagesController < ApplicationController
  AVAILABLE_PAGES = %w[home about]

  def show
    @page_name = AVAILABLE_PAGES.include?(params[:id]) ? params[:id] : "not_found"
  end
end
