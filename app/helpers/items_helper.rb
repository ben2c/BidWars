module ItemsHelper
  def index_display_header
    if @user
      content_tag(:h2, "#{@user.username}'s Posted Items:")
    else
      content_tag(:h2, "All Items")
    end
  end

end
