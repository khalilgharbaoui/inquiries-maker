module ApplicationHelper
  # found here: https://dhampik.com/blog/rails-routes-tricks-with-locales


  def general_lang_switcher
    content_tag(:div, class: 'lang-switcher clearfix') do
      I18n.available_locales.each do |loc|
        concat content_tag(:span, (link_to loc, params.permit(:locale).merge(locale: loc)), class: (I18n.locale == loc ? "active" : "")) + content_tag(:span,"  ")
      end
    end
  end

  def form_lang_switcher(action)
    content_tag(:div, class: 'lang-switcher clearfix') do
      I18n.available_locales.each do |loc|
        concat content_tag(:span, (link_to loc,
        url_for(action: :"#{action}", locale: loc)), class: (I18n.locale == loc ? "active" : "")) + content_tag(:span,"  ")
      end
    end
  end

  def locale_field(inquiry, f)
    if inquiry.persisted?
      content_tag(:div, class: "field") do
        f.label :locale
        f.text_field :locale
      end
    else
      content_tag(:div, class: "field") do
        f.hidden_field :locale, value: I18n.locale
      end
    end
  end
end
