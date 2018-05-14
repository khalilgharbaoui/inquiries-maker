module ApplicationHelper
  # found here: https://dhampik.com/blog/rails-routes-tricks-with-locales


  def general_lang_switcher
    content_tag(:ul, class: 'general-lang-switcher navbar-nav mr-auto') do
      I18n.available_locales.each do |loc|
        concat content_tag(:li, (link_to loc.upcase, params.permit(:locale).merge(locale: loc), class: "nav-link"), class: "nav-item #{(I18n.locale == loc ? "active" : "")}").html_safe
      end
    end
  end

  def form_lang_switcher(action)
    content_tag(:nav, :"aria-label" => 'language switch') do
     content_tag(:ul, class: 'pagination pagination-sm justify-content-end') do
        I18n.available_locales.each do |loc|
          concat content_tag(:li, (link_to loc.upcase,
          url_for(action: :"#{action}", locale: loc), class: "page-link"), class: "page-item #{(I18n.locale == loc ? "active" : "")}").html_safe
        end
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
