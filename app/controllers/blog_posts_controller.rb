class BlogPostsController < ApplicationController
  def index
     @blog_posts = BlogPost.all
     respond_to do |format|
       format.html
     end
   end
   def new
     @blog_post = BlogPost.new
   end

   def create
     logger.info("@@@@Create!")
     logger.info("@@@@PARAMS: #{params[:blog_post][:name]}")
     @blog_post = BlogPost.new(blog_post_params)
     respond_to do |format|
       if @blog_post.save
         format.html  { redirect_to(@blog_post, :notice => 'Blog Post was successfully created.') }
         format.json  { render :json => @post,
                   :status => :created, :location => @post }
       else
         format.html  { render :action => "new" }
         format.json  { render :json => @post.errors,
                       :status => :unprocessable_entity }
       end
     end
   end
   def show
     logger.info("@@@@@SHOW!")
     @blog_post = BlogPost.find(params[:id])
     respond_to do |format|
       format.html #{render 'show'}  
       format.json  { render :json => @blog_post.errors,
                     :status => :unprocessable_entity }
     end
   end
   def edit
     logger.info("@@@@@Edit!")
     @blog_post = BlogPost.find(params[:id])
    end
    
    def update
      @blog_post = BlogPost.find(params[:id])
      logger.info("@@@@@@UPDATE Name/CONTENT: #{@blog_post.name} / #{@blog_post.content}")
      respond_to do |format|
        if @blog_post.update_attributes(blog_post_params)
          format.html  { redirect_to(@blog_post,
                        :notice => 'Blog Post was successfully updated.') }
          format.json  { head :no_content }
        else
          format.html  { render :action => "edit" }
          format.json  { render :json => @blog_post.errors,
                        :status => :unprocessable_entity }
        end
      end
    end   
    def destroy
      @blog_post = BlogPost.find(params[:id])
      @blog_post.destroy

      respond_to do |format|
        format.html  { redirect_to(blog_posts_url,
                      :notice => 'Blog Post was successfully destroyed!') }
        
        #format.html { redirect_to (blog_posts_url,:notice => 'Blog Post was successfully destroyed!') }
        format.json { head :no_content }
      end
    end  

   private
   def blog_post_params
     logger.info("@@@@@@BLOG POST PARAMS!@")
     params.require(:blog_post).permit(:name, :title, :content)
   end
end
