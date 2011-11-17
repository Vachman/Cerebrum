module ActiveAdmin
  module Views
    class TabbedNavigation < Component
      def build_menu_item(item)
        li :id => item.dom_id do |li_element|
          li_element.add_class "current" if current?(item)

          if item.children.any?
            li_element.add_class "has_nested"
            text_node link_to( I18n.t("active_admin.#{item.name.downcase}",:default => item.name), item.url || "#")
            render_nested_menu(item)
          else
            link_to I18n.t("active_admin.#{item.name.downcase}",:default => item.name), item.url
          end
        end
      end
    end
  end
end