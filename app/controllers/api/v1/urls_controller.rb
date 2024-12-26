class Api::V1::UrlsController < ApplicationController
    def create
        url = Url.new(url_params)
        if url.save
            render json: { short_url: url_shortened_path(url.short_url) }, status: :created
          else
            render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
  
    def url_params
      params.require(:url).permit(:original_url)
    end
    
end
