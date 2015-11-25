class LandingController < ApplicationController
  
  # This is the root of the application
  # * *Path* :
  # get /
  # * *Path Params* :
  # * *Args* :
  # * *Returns* :
  #   - <code>@articles</code> -> articles
  #   - <code>@dynamic_title</code> -> SEO
  #   - <code>@dynamic_author</code> -> SEO
  #   - <code>@dynamic_description</code> -> SEO
  #   - <code>@dynamic_keywords</code> -> SEO
  #   - <code>@dynamic_image</code> -> SEO
  def index
    if current_user
      @articles = VArticle.where("publish_status = 'Publish'").order('created_at DESC').paginate(page: params[:page], per_page: app_set('article_size').to_i)
    else
      @articles = VArticle.where("publish_status = 'Publish' and publish_visibility = 'Public'").order('created_at DESC').paginate(page: params[:page], per_page: app_set('article_size').to_i)
    end

    @dynamic_title = "Home" # find something better to change this
    @dynamic_author = "dyo medio" # change this if you want
    @dynamic_description = app_set('site_description')
    @dynamic_keywords = app_set('site_keywords')
    @dynamic_image = "logo.png"
		
  end

end
