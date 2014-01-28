require "test_helper"

feature "VisitingTheBlogPostIndex" do
  scenario "with existing posts, show all fields in list" do
    visit blog_posts_path
    page.must_have_content "Name"
    page.must_have_content "Title"
    page.must_have_content "Content"
  end
  #scenario "when show a post, title should say show" do
  ##  #Xvisit edit_blog_post_path/:id
  #  BlogPost.get(:view, {'id' => '5'})
  #  page.must_have_content "edit"
  #end

end
