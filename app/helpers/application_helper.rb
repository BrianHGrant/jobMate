module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == params[:sort] && params[:direction] == "ASC" ? "DESC" : "ASC"
    link_to title, url_for(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def industries
    @industries ||= begin
      industries_open = File.open('./public/txt/industries.txt')
      industries = industries_open.readlines
      industries.map! {|industry| industry.chomp }
    end
  end

  def formattedTime(time)
    time.strftime("%H:%M")
  end
end
