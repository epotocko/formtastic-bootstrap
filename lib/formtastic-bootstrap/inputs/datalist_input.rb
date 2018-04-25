module FormtasticBootstrap
  module Inputs
    class DatalistInput < Formtastic::Inputs::DatalistInput
      include Base
      
      def to_html
        @name = input_html_options[:id].gsub(/_id$/, "")
        bootstrap_wrapping do
          builder.text_field(method, form_control_input_html_options) << # standard input
          data_list_html # append new datalist element
        end
      end

    end
  end
end
