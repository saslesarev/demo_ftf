module ApplicationHelper
    def breadcrumbs items
        content_tag :div, id: 'breadcrumbs' do 
            safe_join(items.map{|item| item.is_a?(Array) ? link_to(item.first, item.last) : item }, ' / ')
        end
    end
end
