module PostsHelper
  def abstract_contents(contents)
    [contents[0..10], "..."].join("")
  end

end
