module SheetsHelper
  def header_cell(style, _bg_color)
    style.add_style(bg_color: 'FFFFCC',
                    color: Axlsx::Color.new(rgb: 'FFF'),
                    border: Axlsx::STYLE_THIN_BORDER,
                    alignment: { horizontal: :center, vertical: :center })
  end

  def header_cell_with_dates(style, _bg_color)
    style.add_style(bg_color: '0000EE',
                    sz: 12,
                    color: Axlsx::Color.new(rgb: 'FFF'),
                    # border: Axlsx::STYLE_THIN_BORDER,
                    alignment: { horizontal: :right, vertical: :center })
  end

  def highlight_cell(style, bg_color)
    style.add_style(bg_color: bg_color.to_s,
                    border: Axlsx::STYLE_THIN_BORDER,
                    alignment: { horizontal: :center, vertical: :center })
  end

  def highlight_cell_left(style, bg_color)
    style.add_style(bg_color: bg_color.to_s,
                    border: Axlsx::STYLE_THIN_BORDER,
                    alignment: { horizontal: :left, vertical: :center })
  end

  def date_cell(style, bg_color)
    style.add_style(bg_color: bg_color.to_s,
                    format_code: 'dd.mm.yyyy',
                    border: Axlsx::STYLE_THIN_BORDER,
                    alignment: { horizontal: :center, vertical: :center })
  end

  def real_client_salutation(inquiry)
    inquiry_type = inquiry.response_body.dig_deep(:original_kind) + '_inquiry'
    inquiry_locale = inquiry.send(inquiry_type)&.locale&.to_sym || inquiry.response_body.dig_deep(:locale).to_sym
    I18n.t("client_salutations.#{inquiry.response_body.dig_deep(:client_salutation)}", locale: inquiry_locale)
  end
end
