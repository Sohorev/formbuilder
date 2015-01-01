class App.EditDigitsSectionView extends App.EditAbstractView

  events:
    'click .js-add-digit': 'addDigit'
    'click .js-remove-digit': 'removeDigit'
    'click .js-default-updated': 'defaultUpdated'
    'input .digit-value-input': 'forceRender'

  # @todo this should really be on the model, not the view
  addDigit: (e) ->
    $el = $(e.currentTarget)
    i = @$el.find('.digit').index($el.closest('.digit'))
    digits = @model.get(App.Formbuilder.options.mappings.DIGITS) || []
    newDigit = {
      scr: ''
      numb: ''
      mask:[{value: "*"}]
    }

    if i > -1
      digits.splice(i + 1, 0, newDigit)
    else
      digits.push newDigit

    @model.set App.Formbuilder.options.mappings.DIGITS, digits
    @model.trigger "change:#{App.Formbuilder.options.mappings.DIGITS}"
    @forceRender()

  removeDigit: (e) ->
    $el = $(e.currentTarget)
    index = @$el.find(".js-remove-digit").index($el)
    digits = @model.get App.Formbuilder.options.mappings.DIGITS
    digits.splice index, 1
    @model.set App.Formbuilder.options.mappings.DIGITS, digits
    @model.trigger "change:#{App.Formbuilder.options.mappings.DIGITS}"
    @forceRender()
