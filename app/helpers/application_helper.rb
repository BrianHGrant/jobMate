module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "ASC" ? "DESC" : "ASC"
    link_to title, url_for(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
