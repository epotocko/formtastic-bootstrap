module FormtasticBootstrap
  module Inputs
    class DatePickerInput < Formtastic::Inputs::DatePickerInput
      include Base
      include Base::Stringish
      include Base::DatetimePickerish

      def value
        return options[:input_html][:value] if options[:input_html] && options[:input_html].key?(:value)
        val = object.send(method)
        return val if val.nil?
        if val.is_a?(Time)
          val = Date.new(val.year, val.month, val.day)
        end
        if val.is_a?(Date)
          return I18n.localize(val, format: :short)
        end
        val.to_s
      end

    end
  end
end
