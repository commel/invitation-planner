module InvitationsHelper
  
  def boolicon(value)
    icon = value ? "gylphicon-thumbs-up" : "gylphicon-thumbs-down"
    content_tag :span, class: "gylphicon #{icon}"
  end
  
end
