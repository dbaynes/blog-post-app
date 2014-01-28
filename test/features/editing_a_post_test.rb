require "test_helper"

feature "Editing A Blog Post" do
  scenario "submit updates to an existing blog post" do
    # - The post author goes to an existing Post detail ("show") page
    # - That page should have a link to "Edit" that the author can click
    # - A form is filled in with the changed attributes
    # - The form is submitted
    # - The newly updated post should be shown to the author with a confirmation message
    
    # Given an existing blog_post
    ##blog_post = BlogPost.create(title:"Becoming a Code Fellow",name:"D Baynes", content: "Means striving for excellence.")
    ##visit blog_post_path(blog_post)
    ##fill_in "Title", with: "Becoming a web developer"
    ##click_on "Update Post"
    # Then the blog_post is updated
      blog_post = BlogPost.create(title: "Becoming a Code Fellow", name:"DBaynes", content: "Means striving for excellence.")
        visit blog_post_path(blog_post)
        # When I click edit and submit changed data
        click_on "Edit"
        fill_in "Title", with: "Becoming a Web Developer"
        click_on "Update Post"
        # Then the post is updated
        page.text.must_include "Post was successfully updated"
        page.text.must_include "Web Developer"
  end
end
