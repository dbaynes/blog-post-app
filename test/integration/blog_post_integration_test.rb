require "minitest_helper"

describe "Blog Posts integration" do
  it "shows blog post's name" do
    blog_post = BlogPost.create!(title:"Integration Test", name: "Integration Test Name")
    visit blog_post_path(blog_post)
    page.text.must_include "Integration Test Name"
  end
end