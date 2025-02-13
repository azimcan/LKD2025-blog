class FormBuilder < ActionView::Helpers::FormBuilder
  # def text_field(method, options = {})
  #   @default_html_options[:class] = ["block shadow-sm rounded-md border outline-hidden px-3 py-2 mt-2 w-full"]
  #   @default_html_options[:placeholder] = true
  #   @template.text_field(@object_name, method, objectify_options(@default_html_options.merge(options)))
  # end
  %i[text_field password_field url_field email_field number_field search_field
     range_field date_field datetime_field text_area textarea rich_text_area phone_field].each do |selector|
    class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
      def #{selector}(method, options = {})
        @default_html_options[:class] = ["block shadow-sm rounded-md border outline-hidden px-3 py-2 mt-2 w-full"]
        @default_html_options[:placeholder] = true
        @template.public_send(
          #{selector.inspect},
          @object_name,
          method,
          objectify_options(@default_html_options.merge(options)))
      end
    RUBY_EVAL
  end
end
