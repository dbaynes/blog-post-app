require "test_helper"

feature "Creating A Post" do
  scenario "for new posts, title should say new" do
    #Given a completed new post form
    #When I submit the form
    #Then a new post should be created and displayed
    visit new_blog_post_path
    page.must_have_content "new"
  end
  scenario "submit form data to create new post 1" do
    #Given a completed new blog post form
    blog_post = BlogPost.create!(title:"Mini Test Title",name:"Mini Test")
    # When I visit /blog_posts
    visit blog_posts_path
    #blog_post.to_param.must_equal "#{blog_post.id}-mini-test"
    page.text.must_include "Mini Test"
  end
  scenario "submit form data to create new post 2" do
     #Given a completed new blog post form
     visit new_blog_post_path
     fill_in "Title", with: "Code Rails"
     fill_in "Name", with: "D Baynes"
     fill_in "Content", with: "This is how I learned to make Rails apps."
     # When I submit the form
     click_on "Create Post"
     # Then a new post should be created and displayed
     page.text.must_include "Blog Post was successfully created"
     page.text.must_include "how I learned to make Rails apps"
   end
  scenario "submit form data to create new post via rails cast 3" do
   blog_post = BlogPost.create!(title:"Mini Test Title",name:"Mini Test")
    blog_post.to_param.must_equal "#{blog_post.id}-mini-test"
  end
end
