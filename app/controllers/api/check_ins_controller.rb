class Api::CheckInsController < ApplicationController
    def create
        @check_in = CheckIn.new(check_in_params)
        if @check_in.save
            @beer = Beer.find(@check_in.beer_id)
            @brewery = Brewery.find(@beer.brewery_id)
            @user = User.find(@check_in.user_id)
            render :show
        else
            render json: @check_in.errors.full_messages, status: 422
        end    
    end

    def search
        @check_ins = CheckIn.where(beer_id: params[:beer_id])
            render "/api/check_ins/index"
    end

    def show
        @check_in = CheckIn.find(params[:id])
    end
    
    private
    def check_in_params
        params.require(:check_in).permit(:beer_id, :user_id, :review, :rating)
    end

end
