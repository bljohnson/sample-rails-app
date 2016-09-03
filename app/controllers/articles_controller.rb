# a controller is a class defined to inherit from ApplicationController. Inside class you define methods that become actions for this controller. Actions perform CRUD operations on articles within system.
# frequent practice is to place CRUD actions in each controller in following order: index, show, new, edit, create, update, and destroy. Public methods must be placed before private or protected methods in controller in order to work.
class ArticlesController < ApplicationController
	# list all articles created
	def index
		@articles = Article.all
	end

	def show
		# find article we're interested in, and get :id parameter from request. use an instance variable (prefixed with @) to hold a reference to article object. Rails will pass all instance variables to the view
		@article = Article.find(params[:id])
	end

	def new
	end

	# use Article model to save data in db
	def create
	  @article = Article.new(article_params)

	  @article.save
	  redirect_to @article
	end

	 # allow and require the title and text parameters for valid use of create. factored out into own method so can be reused by multiple actions in same controller. often made private to make sure it can't be called outside its intended context
	private
	  def article_params
	    params.require(:article).permit(:title, :text)
	  end
end