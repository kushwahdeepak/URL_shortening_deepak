class UrlsController < ApplicationController
    def new
      @url = Url.new
    end
  
    def create
      @url = Url.new(params)
      if @url.save
        render json: { short_url: url_shortened_path(@url.short_url) }, status: :created
      else
        render json: { errors: @url.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def show
      url = Url.find_by(short_url: params[:short_url])
      if url
        redirect_to url.original_url
      else
        render plain: 'URL not found', status: :not_found
      end
    end
  
    private
  
    def params
      params.require(:url).permit(:original_url)
    end
  end