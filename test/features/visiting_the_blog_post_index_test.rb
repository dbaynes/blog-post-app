require "test_helper"

feature "VisitingTheBlogPostIndex" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Blog Posts"
    page.wont_have_content "Delete"
  end
  scenario "with existing posts, show all fields in list" do
    visit blog_posts_path
    page.must_have_content "Name"
    page.must_have_content "Title"
    page.must_have_content "Content"
  end
  scenario "for new posts, title should say new" do
    visit new_blog_post_path
    page.must_have_content "new"
    
  end
  #scenario "when show a post, title should say show" do
  #  #Xvisit edit_blog_post_path/:id
  #  BlogPost.get(:view, {'id' => '5'})
  #  page.must_have_content "edit"
  #end

end
