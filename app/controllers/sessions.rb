JobVacancy::App.controllers :sessions do
  
  get :login, :map => '/login' do
    @user = User.new
    render 'sessions/new'
  end

  post :create do
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.authenticate(email, password)
    if (@user.nil?)
      @user = User.new
      flash.now[:error] = 'Invalid credentials'
      render 'sessions/new'
    else
      if(not @user.nil? and not @user.integer?)
        sign_in @user
        redirect '/' 
      else
        if (@user > 0)
          if(@user > 1)
            flash.now[:error] = 'Incorrect password you left ' + @user.to_s + ' trys'
          else
            flash.now[:error] = 'Incorrect password you left ' + @user.to_s + ' try'
          end
        else
          flash.now[:error] = 'Your account has been blocked for 24 hours'
        end
        @user = User.new
        render 'sessions/new'
      end
    end
  end

  get :destroy, :map => '/logout' do 
    sign_out
    redirect '/'          
  end

  def show_warning(number)
    if (user > 0)
      if(user > 2)
      flash.now[:error] = 'Incorrect password you left' + user.to_s + 'trys'
      else
      flash.now[:error] = 'Incorrect password you left' + user.to_s + 'try'
      end
    else
      if(user <= 0)
        flash.now[:error] = 'Incorrect password, your account has been blocked for 24 hours'
      else
        flash.now[:error] = 'Your account has been blocked for 24 hours'
      end
    end
  end

end
