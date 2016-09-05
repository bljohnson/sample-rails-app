class CommentsController < ApplicationController
	def create
		# get the article in question since each request for a comment has to keep track of the article comment is attached to
		@article = Article.find(params[:article_id])
		# create and save comment, links comment to particular article
		@comment = @article.comments.create(comment_params)
		# send user back to original article
		redirect_to article_path(@article)
	end

	# find the article we are looking at, locate the comment within the @article.comments collection, and then remove it from the database
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
