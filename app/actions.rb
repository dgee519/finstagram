helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

  
  get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)
  end

  get '/signup' do     # if a user navigates to the path "/signup",
    @user = User.new   # setup empty @user object
    erb(:signup)       # render "app/views/signup.erb"
  end

  post '/signup' do
      email      = params[:email]
      avatar_url = params[:avatar_url]
      username   = params[:username]
      password   = params[:password]
    
      @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })
    
      if @user.save
        redirect to('/login')
      else
        erb(:signup)
      end
  end

  get '/login' do  #when a GET request comes into /login
    erb(:login)    #render app/views/login.erb
  end

  post '/login' do    #when we submit a form with an action of /login
    username = params[:username]
    password = params[:password]

    #1. find user by username
    @user = User.find_by(username: username)

    #2. if that user exists
      if @user && @user.password == password
        session[:user_id] = @user.id
        redirect to('/')
      else
        @error_message = "Login Failed."
        erb(:login)
      end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to('/')
  end

  get '/finstagram_posts/new' do
    @finstagram_post = FinstagramPost.new
    erb(:"finstagram_posts/new")
  end

  post '/finstagram_posts' do
    photo_url = params[:photo_url]
  
    @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })
  
    if @finstagram_post.save
      redirect(to('/'))
    else
      erb(:"finstagram_posts/new")
    end
  end

  get '/finstagram_posts/:id' do
    @finstagram_post = FinstagramPost.find(params[:id])   # find the finstagram post with the ID from the URL
    erb(:"finstagram_posts/show")    
  end


