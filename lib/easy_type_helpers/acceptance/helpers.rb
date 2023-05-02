module Helpers

  def manifest_for(resource_value, values = {})
    resource_hash = resource_value.merge(values)
    manifest = ERB.new(<<-EOD, trim_mode: '-').result(binding)
      <%= resource_name -%>{'<%= resource_title -%>':
        <% resource_hash.each do |k,v| -%>
          <% if v.is_a?(String) -%>
            <%= k -%> => "<%= v.to_s.inspect[1..-2] -%>",
          <% else -%>
            <%= k -%> => <%= v -%>,
          <% end -%>
        <% end -%>
      }
    EOD
    manifest
  end
end