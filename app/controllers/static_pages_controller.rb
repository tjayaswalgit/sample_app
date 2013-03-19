class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def mission
  end
  
  def sitemap
  end
  
  def faq
  end
  
  def advertise
  end
  
  def disclaimer
  end

  def about_homeopathy
  end

  def case_studies
  end

  def testimonials
  end

end
