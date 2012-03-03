class Admin::InvestorProfilesController < AdminController
  # GET /investor_profiles
  # GET /investor_profiles.json
  def index
    @investor_profiles = InvestorProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @investor_profiles }
    end
  end

  # GET /investor_profiles/1
  # GET /investor_profiles/1.json
  def show
    @investor_profile = InvestorProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @investor_profile }
    end
  end

  # GET /investor_profiles/new
  # GET /investor_profiles/new.json
  def new
    @investor_profile = InvestorProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @investor_profile }
    end
  end

  # GET /investor_profiles/1/edit
  def edit
    @investor_profile = InvestorProfile.find(params[:id])
  end

  # POST /investor_profiles
  # POST /investor_profiles.json
  def create
    @investor_profile = InvestorProfile.new(params[:investor_profile])

    respond_to do |format|
      if @investor_profile.save
        format.html { redirect_to @investor_profile, notice: 'Investor profile was successfully created.' }
        format.json { render json: @investor_profile, status: :created, location: @investor_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @investor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /investor_profiles/1
  # PUT /investor_profiles/1.json
  def update
    @investor_profile = InvestorProfile.find(params[:id])

    respond_to do |format|
      if @investor_profile.update_attributes(params[:investor_profile])
        format.html { redirect_to @investor_profile, notice: 'Investor profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @investor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investor_profiles/1
  # DELETE /investor_profiles/1.json
  def destroy
    @investor_profile = InvestorProfile.find(params[:id])
    @investor_profile.destroy

    respond_to do |format|
      format.html { redirect_to investor_profiles_url }
      format.json { head :no_content }
    end
  end
end
