class App.EditDropdownView extends App.EditAbstractView

  events:
    'click .js-add-option': 'addOption'
    'click .js-remove-option': 'removeOption'
    'click .js-default-updated': 'defaultUpdated'
    'input .option-label-input': 'forceRender'

  # @todo this should really be on the model, not the view
  addOption: (e) ->
    $el = $(e.currentTarget)
    i = @$el.find('.option').index($el.closest('.option'))
    options = @model.get(App.Formbuilder.options.mappings.OPTIONS) || []
    newOption = {label: "", checked: false}

    if i > -1
      options.splice(i + 1, 0, newOption)
    else
      options.push newOption

    @model.set App.Formbuilder.options.mappings.OPTIONS, options
    @model.trigger "change:#{App.Formbuilder.options.mappings.OPTIONS}"
    @forceRender()

  removeOption: (e) ->
    $el = $(e.currentTarget)
    index = @$el.find(".js-remove-option").index($el)
    options = @model.get App.Formbuilder.options.mappings.OPTIONS
    options.splice index, 1
    @model.set App.Formbuilder.options.mappings.OPTIONS, options
    @model.trigger "change:#{App.Formbuilder.options.mappings.OPTIONS}"
    @forceRender()
