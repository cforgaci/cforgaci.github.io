-- external-links.lua
-- Make DOI/external links open in new tab and add ↗ icon

function Link(el)
  local is_external = el.target:match("^https?://") or el.target:match("doi.org")

  if is_external then
    -- open in new tab
    el.attributes.target = "_blank"
    el.attributes.rel = "noopener noreferrer"

    -- add a small ↗ icon
    local icon = pandoc.RawInline("html", ' <span style="font-size:0.8em;">↗</span>')
    return pandoc.Span({el, icon})
  end

  return el
end
