class Admin::InvestorProfilesController < AdminController
  def index
    @investor_profiles = InvestorProfile.all
  end

  def show
    @investor_profile = get_investor_profile(params[:id])
  end

  def new
    @investor_profile = InvestorProfile.new
  end

  def edit
    @investor_profile = get_investor_profile(params[:id])
  end

  def create
    @investor_profile = InvestorProfile.new(params[:investor_profile])

    if @investor_profile.save
      redirect_to admin_investor_profiles_path, notice: 'Investor profile was successfully created.'
    else
      render :new
    end
  end

  def update
    @investor_profile = get_investor_profile(params[:id])

    if @investor_profile.update_attributes(params[:investor_profile])
      redirect_to admin_investor_profiles_path, notice: 'Investor profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @investor_profile = get_investor_profile(params[:id])
    @investor_profile.destroy

    redirect_to investor_profiles_url
  end
  
  private
  def get_investor_profile(investor_profile_id)
    InvestorProfile.find(investor_profile_id)
  end
end
