module ApplicationHelper
  def inquiry_received?(inquiry)
    find_received_inquiry_response_body(inquiry).first || link_to_reschedule(inquiry)
  end

  def link_to_reschedule(inquiry)
    link_to '❌ Reschedule!?', { action: 'reschedule_inquiry', id: inquiry.id, locale: inquiry.locale }
  end

  def general_lang_switcher
    # https://dhampik.com/blog/rails-routes-tricks-with-locales

    tag.ul(class: 'general-lang-switcher navbar-nav mr-auto') do
      I18n.available_locales.each do |loc|
        concat tag.li((link_to loc.upcase, url_for(action: :"#{action_name}", locale: loc), class: 'nav-link'), class: "nav-item #{(I18n.locale == loc ? 'active' : ' ')}").html_safe
      end
    end
  end

  def form_lang_switcher(action)
    tag.div do
      tag.div(class: 'pagination pagination-sm shadow') do
        I18n.available_locales.each do |loc|
          concat tag.li((link_to loc.upcase, url_for(action: :"#{action}", locale: loc), class: 'page-link'), class: "page-item #{(I18n.locale == loc ? 'active' : ' ')}").html_safe
        end
      end
    end
  end

  def locale_field(inquiry, f)
    if inquiry.persisted?
      tag.div(class: 'field') do
        f.label :locale
        f.text_field :locale
      end
    else
      tag.div(class: 'field') do
        f.hidden_field :locale, value: I18n.locale
      end
    end
  end

  def options_for_enum(object, enum)
    options = enums_to_translated_options_array(object.class.name, enum.to_s)
    options_for_select(options, object.send(enum))
  end

  def enums_to_translated_options_array(klass, enum)
    klass.classify.safe_constantize.send(enum.pluralize).map do |key, _value|
      [I18n.t("activerecord.enums.#{klass.downcase}.#{enum}.#{key}").humanize, key]
    end
  end

  def errors_for(object)
    if object.errors.any?
      tag.div(class: 'card border-danger custom_error_explanation shadow') do
        concat(tag.div(class: 'card-header bg-danger text-white') do
          concat "#{pluralize(object.errors.count, 'error')} prohibited this #{object.class.name.downcase} from being saved:"
        end)
        concat(tag.ul(class: 'mb-0 list-group list-group-flush') do
          object.errors.full_messages.each do |msg|
            concat tag.li(msg, class: 'list-group-item')
          end
        end)
      end
    end
  end

  def show_received_inquiry_response(inquiry)
    find_received_inquiry_response_body(inquiry)
  end

  def find_received_inquiry_response_body(inquiry)
    response = inquiry.received_inquiry_response
    response&.response_body&.transform_keys!(&:to_sym) || []
  end

  def from_date(inquiries)
    inquiries.min_by{ :created_at }.created_at
  end

  def until_date(inquiries)
    inquiries.max_by{ :created_at }.created_at
  end

  def id_from_response_body(response_body)
    result = response_body.dig_deep(:id)
    result.respond_to?(:count) && result.count == 2 ? result.first : result
  end
end
