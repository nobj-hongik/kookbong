module ApplicationHelper
 def active_class(any_path)
  current_page?(any_path) ? "active" : ""
 end 
 
  def ga_script
    tracking_id = "UA-99982943-5"
    if Rails.env.production?
      javascript_tag("(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', '#{tracking_id}', 'auto');")
    end
  end

  def ga_track
    javascript_tag("if(window.ga != undefined){ga('send', 'pageview');}")
  end
 
end
