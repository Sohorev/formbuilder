App.Formbuilder.registerField 'section_break',

  order: 0

  type: 'non_input'

  view: """
    <label class='section-name'><%= rf.get(App.Formbuilder.options.mappings.LABEL) %></label>
    <p><%= rf.get(App.Formbuilder.options.mappings.DESCRIPTION) %></p>
  """

  edit: """
    <div class='fb-edit-section-header'>Label</div>
    <input type='text' data-rv-input='model.<%= App.Formbuilder.options.mappings.LABEL %>' />
    <textarea data-rv-input='model.<%= App.Formbuilder.options.mappings.DESCRIPTION %>'
      placeholder='Add a longer description to this field'></textarea>
  """

  addButton: """
    <span class='symbol'><span class='fa fa-minus'></span></span> Section Break
  """
