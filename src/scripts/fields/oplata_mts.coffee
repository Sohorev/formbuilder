App.Formbuilder.registerField 'oplata_mts',

  order: 0

  view: """
    <input type='text' class='rf-size-<%= rf.get(App.Formbuilder.options.mappings.SIZE) %>' />
  """

  edit: """
    <%= App.Formbuilder.templates['edit/size']() %>
    <%= App.Formbuilder.templates['edit/min_max_length']() %>
    <%= App.Formbuilder.templates['edit/digits']() %>
  """

  addButton: """
    <span class='symbol'><span class='fa fa-font'></span></span> Text
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.size = 'small'

    attrs.field_options.scr = ''
    attrs.field_options.numb = ''
    attrs.field_options.mask = [
      {value: "*"}
    ]

    attrs.field_options.masks = [
      value: "*"
    ]
    attrs
