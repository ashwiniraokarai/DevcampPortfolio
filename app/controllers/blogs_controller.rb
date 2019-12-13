class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    #Ash: If you wanted to display only 1 blog out of all the blogs in the DB, you'd do Blog.limit(1)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    #Ash: :show Calls the set_blog method due to the before_action on top.
    #So do methods :edit, :update, :destroy
    #Things to try:
      #@blog = Blog.find(params[:id])
      #@blog = Blog.find(2)
  end

  # GET /blogs/new
  def new
    #Ash: new instantiates a new Blog Model object and..
    #gives the ability to have the form to create a new Blog
    #new needs to connect the form (vis submit) to create action
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    #Ash: Simply brings up the edit from and connects to update action on submit
    #Of course, it runs the set_blog first, to get hold of the specific blog in question so that form can grab it
  end

  # POST /blogs
  # POST /blogs.json
  #Ash: create action actually creates the blog when the new form is submitted
  def create
    #Ash: Instantiate a new Blog Model Object with the new.html.erb form data submitted
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        #AsH: redirect to the show method (same as redirect_to blog_path(@blog) )
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      #Ash: redirect to the index page
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #Ash: Defining action to support custom route: toggle_status_blog POST   /blogs/:id/toggle_status(.:format)                                                       blogs#toggle_status
  def toggle_status
    #has access to @blog (instance var) through set_blog method configured to run via before_action
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url #this is just a test. needs to do something more meaningful
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      #Originally was @blog = Blog.find(params[:id])
      @blog = Blog.friendly.find(params[:id])   #.friendly is for mapping the slug for friendly ids on the urls. See https://github.com/norman/friendly_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
