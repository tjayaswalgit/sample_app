class FaqsController < ApplicationController
  # GET /faqs
  # GET /faqs.json
  def index
    #@faqs = Faq.all
   @faqs = Faq.paginate(page: params[:page])
   #@categories = Category.all

      



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faqs }
    end
  end


#  def move
#    @faqs = Faq.paginate(page: params[:page])
#    @categories = Category.all
#    if ["move_lower","move_higher","move_to_top","move_to_bottom"].include?
#    (params[:method]) \
#    and params[:faq_id] =~ /^\d+$/
#    Faq.find(params[:faq_id]).send(params[:method])
#    end
#    #redirect_to(:action => "index", :id => 1)
#    redirect_to faqs_url
#  end


  # GET /faqs/1
  # GET /faqs/1.json
  def show
    @faq = Faq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Faq.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faq }
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
    @categories = Category.all
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        format.html { redirect_to @faq, notice: 'Faq was successfully created.' }
        format.json { render json: @faq, status: :created, location: @faq }
      else
        format.html { render action: "new" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to @faq, notice: 'Faq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faqs_url }
      format.json { head :no_content }
    end
  end
end
