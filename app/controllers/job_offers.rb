JobVacancy::App.controllers :job_offers do

  
  get :postulation do
    @apps = JobApplication.all(user: current_user)
    render 'job_offers/postulation'
  end 
  
  get :my do
    @offers = JobOffer.find_by_owner(current_user)
    render 'job_offers/my_offers'
  end    

  get :index do
    @offers = JobOffer.all_active
    render 'job_offers/list'
  end  

  get :new do
    @job_offer = JobOffer.new
    render 'job_offers/new'
  end

  get :latest do
    @offers = JobOffer.all_active
    @quantity_of_results = @offers.size
    render 'job_offers/list'
  end

  get :edit, :with =>:offer_id  do
    @job_offer = JobOffer.get(params[:offer_id])
    # ToDo: validate the current user is the owner of the offer
    render 'job_offers/edit'
  end

  get :apply, :with =>:offer_id  do

    @job_offer = JobOffer.get(params[:offer_id])

    @apps = JobApplication.all(user: current_user)
    @flag = false

    @apps.each{ |ap|
      if(ap.job_offer_id.to_i == params[:offer_id].to_i)
        @flag = true
      end
    }
    if(@flag)
      flash[:error] = 'you are postulated to this offer'
      redirect '/job_offers'
    else
      @job_offer = JobOffer.get(params[:offer_id])
      @job_application = JobApplication.new
      # ToDo: validate the current user is the owner of the offer
      render 'job_offers/apply'
    end
  end

  post :search do
    @offers = JobOffer.all(:title.like => "%#{params[:q]}%")
    @quantity_of_results = @offers.size
    if(@offers.size == 0)
      flash.now[:error] = 'no results found'
    end
    render 'job_offers/list'
  end


  post :apply, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])    
    applicant_email = params[:job_application][:applicant_email]
    @job_application = JobApplication.create_for(applicant_email, @job_offer, current_user)
    @job_application.process
    flash[:success] = 'Contact information sent.'
    redirect '/job_offers'
  end

  post :create do
    @job_offer = JobOffer.new(params[:job_offer])
    @job_offer.owner = current_user
    if @job_offer.save
      if params['create_and_twit']
        TwitterClient.publish(@job_offer)
      end
      flash[:success] = 'Offer created'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/new'
    end  
  end

  post :update, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.update(params[:job_offer])
    if @job_offer.save
      flash[:success] = 'Offer updated'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Title is mandatory'
      render 'job_offers/edit'
    end  
  end

  put :activate, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.activate
    if @job_offer.save
      flash[:success] = 'Offer activated'
      redirect '/job_offers/my'
    else
      flash.now[:error] = 'Operation failed'
      redirect '/job_offers/my'
    end  
  end


  put :deactivate, :with => :offer_id do
    @job_offer = JobOffer.get(params[:offer_id])
    @job_offer.deactivate
    @job_offer.save
    flash[:success] = 'Offer deactivate'
    redirect '/job_offers/my'
  end



  delete :destroy do
    @job_offer = JobOffer.get(params[:offer_id])
    if @job_offer.destroy
      flash[:success] = 'Offer deleted'
    else
      flash.now[:error] = 'Title is mandatory'
    end
    redirect 'job_offers/my'
  end


end
