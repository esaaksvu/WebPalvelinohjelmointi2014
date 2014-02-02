class MembershipsController < ApplicationController
  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.all
  end

  def create
    @membership = Membership.new  params.require(:membership).permit(:beer_club_id)


    if @membership.save
      current_user.memberships << @membership
      redirect_to
    else
      @beer_clubs = BeerClub.all
      render :new
    end

  end

  def destroy
  end

end
