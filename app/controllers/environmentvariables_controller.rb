class EnvironmentvariablesController < ApplicationController

  def index   
    #redirect_to :controller => 'faqs', :action => 'index'
    #show_site
    my_name = "tarun"
    render(:text => "Hello #{my_name}!")


  end

  def show_site
    # Redirect to an external URL
    redirect_to "http://www.rubyonrails.org/"

  end

  def show_record
   # redirect_to :controller => "categories", :action => "show", :id => params[:id]

  end
   
end
