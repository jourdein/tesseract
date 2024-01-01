module Tesseract::Helpers
  module UiElementsHelper
    def tesseract_render(ref, **attrs, &block)
      comp = if ref.is_a? ViewComponent::Base
        ref
      else
        klass = component_class(ref)
        klass.new(**attrs)
      end

      if block
        public_send render_method_name, comp, &block
      else
        public_send render_method_name, comp
      end
    end

    private

    COMPONENT_CLASS = {}

    def render_method_name
      :render
    end

    def component_class(ref)
      klass = COMPONENT_CLASS[ref]
      if klass.nil?
        ref = ref.to_s.tr('-', '_')
        class_namespace = ref.camelize

        begin
          klass = "#{class_namespace}::Component".constantize
        rescue
          klass = "#{class_namespace}Component".constantize
        end

        COMPONENT_CLASS[ref] = klass
      end
    end
  end
end
