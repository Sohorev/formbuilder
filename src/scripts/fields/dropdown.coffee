App.Formbuilder.registerField 'dropdown',

  order: 24

  view: """
    <select>
      <% if (rf.get(App.Formbuilder.options.mappings.INCLUDE_BLANK)) { %>
        <option value=''></option>
      <% } %>

      <% for (i in (rf.get(App.Formbuilder.options.mappings.OPTIONS) || [])) { %>
        <option <%= rf.get(App.Formbuilder.options.mappings.OPTIONS)[i].checked && 'selected' %>>
          <%= rf.get(App.Formbuilder.options.mappings.OPTIONS)[i].label %>
        </option>
      <% } %>
    </select>
  """

  edit: """
    <%= App.Formbuilder.templates['edit/options']({ includeBlank: true }) %>
  """

  addButton: """
    <span class="symbol"><span class="fa fa-caret-down"></span></span> Dropdown
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.options = [
      label: "",
      checked: false
    ,
      label: "",
      checked: false
    ]

    attrs.field_options.include_blank_option = false

    attrs