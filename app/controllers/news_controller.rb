class NewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_news, only: %i[ show edit update destroy ]
  authorize_resource

  # GET /news or /news.json
  def index
    @news = News.all
  end

  # GET /news/1 or /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
    @edited_times = 5 - News.find(params[:id])[:edited_times]
  end

  # POST /news or /news.json
  def create
    @news = News.new(title: news_params[:title], content: news_params[:content], user_id: current_user.id)

    respond_to do |format|
      if @news.save
        format.html { redirect_to news_url(@news), notice: "Новость успешно создана." }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1 or /news/1.json
  def update

    

      edited_times = 1 + @news[:edited_times]

      if current_user.role == "reader"
        
        if edited_times <= 5
          respond_to do |format|
            if @news.update(title: news_params[:title], content: news_params[:content], edited_times: edited_times)
              format.html { redirect_to news_url(@news), notice: { text: "Новость успешно обновлена.", color: "green" } }
              format.json { render :show, status: :ok, location: @news }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @news.errors, status: :unprocessable_entity }
            end
          end
        else
        
          respond_to do |format|
            format.html { redirect_to @news, notice: { text: "Не осталось кол-ва редактирований !", color: "red" } }
            format.json { render json: @news.errors, status: :method_not_allowed }
          end
        
        end

      elsif current_user.role == "admin"
        respond_to do |format|
          if @news.update(title: news_params[:title], content: news_params[:content])
            format.html { redirect_to news_url(@news), notice: { text: "Новость успешно обновлена.", color: "green" } }
            format.json { render :show, status: :ok, location: @news }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @news.errors, status: :unprocessable_entity }
          end
        end
      end
    
  end

  # DELETE /news/1 or /news/1.json
  def destroy
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_url, notice: "Новость удалена." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_params
      params.require(:news).permit(:title, :content)
    end

end
