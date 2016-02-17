module MenuHelpers
  def get_category_name(id)
    Category.get(id).name
  end
end