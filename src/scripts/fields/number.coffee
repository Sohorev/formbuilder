App.Formbuilder.registerField 'number',

  order: 30

  view: """
    <input type='text' />
    <% if (units = rf.get(App.Formbuilder.options.mappings.UNITS)) { %>
      <%= units %>
    <% } %>
  """

  edit: """
    <%= App.Formbuilder.templates['edit/min_max']() %>
    <%= App.Formbuilder.templates['edit/units']() %>
    <%= App.Formbuilder.templates['edit/integer_only']() %>
  """

  addButton: """
    <span class="symbol"><span class="fa fa-number">123</span></span> Number
  """
