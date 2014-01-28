require "test_helper"

feature "Deleting A Post" do
  
  scenario "Blog Post is deleted with a click" do
      # Given an existing post
      BlogPost.create(title: "Becoming a Code Fellow2", name: "Dbaynes", content: "Means striving for excellence.")
      visit blog_posts_path
      # When the delete link is clicked
      click_on.first "Destroy"
      # Then the post is deleted
      page.wont_have_content "Becoming a Code Fellow2"
    end
  
end
