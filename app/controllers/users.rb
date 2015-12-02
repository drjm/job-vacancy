JobVacancy::App.controllers :users do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :new, :map => '/register' do
    @user = User.new
    render 'users/new'
  end

  post :create do
      password_confirmation = params[:user][:password_confirmation]
      params[:user].reject!{|k,v| k == 'password_confirmation'}

      @int_validation = (params[:user][:password].to_s =~ /\d+/) != nil
      @str_validation = (params[:user][:password].to_s =~ /\D+/) != nil
      @size_validation = params[:user][:password].to_s.size >= 8
      
      if(@size_validation)
        if(@str_validation)
          if(@int_validation)
            if (params[:user][:password] == password_confirmation)
              @user = User.new(params[:user])
              if @user.save
                flash[:success] = 'User created'
                redirect '/'
              else
                flash.now[:error] = 'All fields are mandatory'
                render 'users/new'
              end
            else
              @user = User.new (params[:user])
              flash.now[:error] = 'Passwords do not match'
              render 'users/new'          
            end
          else
            @user = User.new (params[:user])
            flash.now[:error] = 'the password must contain at least 1 number'
            render 'users/new' 
          end
        else
          @user = User.new (params[:user])
          flash.now[:error] = 'the password must contain at least 1 letter'
          render 'users/new' 
        end 
      else
        @user = User.new (params[:user])
        flash.now[:error] = 'the password must contain at least 8 characters'
        render 'users/new'
      end
  end

  get :profile, :map => '/profile'do    
    render 'users/user_profile'
  end
  
  get :go_to_edit, :map => '/edit' do
    render 'users/user_profile_edit'
  end

  post :edit do
      password = params[:user][:password]
      password_confirmation = params[:user][:password_confirmation]
      params[:user].reject!{|k,v| k == 'password_confirmation'}
      if ((password != "" && password_confirmation != "") && password == password_confirmation)
        current_user.crypted_password = ::BCrypt::Password.create(password)
        flash.now[:success] = 'Data Updated!, password was change to ' + password
      else
        current_user.crypted_password = current_user.crypted_password
        if(password == "" && password_confirmation = "")
          flash.now[:success] = 'Data Updated!'
        else
          flash.now[:error] = 'Data Updated!, password unchange dont match'
        end

      end
      current_user.name = params[:user][:name]
      current_user.email = params[:user][:email]
      current_user.specialties = params[:user][:specialties]
      current_user.save
      render 'users/user_profile'
  end

end
