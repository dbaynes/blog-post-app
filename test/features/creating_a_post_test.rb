require "test_helper"

feature "CreatingAPost" do
  #scenario "the test is sound" do
  #  visit root_path
  #  page.must_have_content "Hello World"
  #  page.wont_have_content "Goobye All!"
  #end
  scenario "creating the post" do
    blog_post = BlogPost.create!(title:"Mini Test Title",name:"Mini Test")
    blog_post.to_param.must_equal "#{blog_post.id}-mini-test"
  end
 end
