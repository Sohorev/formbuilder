App.Formbuilder.registerField 'text',

  order: 0

  view: """
    <input type='text' class='rf-size-<%= rf.get(App.Formbuilder.options.mappings.SIZE) %>' />
  """

  edit: """
    <%= App.Formbuilder.templates['edit/masks']() %>
    <%= App.Formbuilder.templates['edit/size']() %>
    <%= App.Formbuilder.templates['edit/min_max_length']() %>
  """

  addButton: """
    <span class='symbol'><span class='fa fa-font'></span></span> Text
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.size = 'small'
    attrs.field_options.masks = [
      value: "*"
    ]
    attrs
