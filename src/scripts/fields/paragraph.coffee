App.Formbuilder.registerField 'paragraph',

  order: 5

  view: """
    <textarea class='rf-size-<%= rf.get(App.Formbuilder.options.mappings.SIZE) %>'></textarea>
  """

  edit: """
    <%= App.Formbuilder.templates['edit/size']() %>
    <%= App.Formbuilder.templates['edit/min_max_length']() %>
  """

  addButton: """
    <span class="symbol">&#182;</span> Paragraph
  """

  defaultAttributes: (attrs) ->
    attrs.field_options.size = 'small'
    attrs
