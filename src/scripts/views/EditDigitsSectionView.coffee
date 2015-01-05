class App.EditDigitsSectionView extends App.EditAbstractView

  events:
    'click .js-add-digit': 'addDigit'
    'click .js-remove-digit': 'removeDigit'
    'click .js-default-updated': 'defaultUpdated'
    'input .digit-value-input': 'forceRender'
    'click .js-add-mask': 'addMask'
    'click .js-remove-mask': 'removeMask'

  # @todo this should really be on the model, not the view
  addDigit: (e) ->
    $el = $(e.currentTarget)
    i = @$el.find('.digit').index($el.closest('.digit'))
    digits = @model.get(App.Formbuilder.options.mappings.DIGITS) || []
    newDigit = {
      scr: ''
      numb: ''
      masks:[{value: "*"}]
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
     
  # @todo this should really be on the model, not the view
  addMask: (e) ->
    $el = $(e.currentTarget)
    digitI = @$el.find('.digit').index($el.closest('.digit'))
    i = @$el.find('.mask').index($el.closest('.mask'))
    digits = @model.get(App.Formbuilder.options.mappings.DIGITS)
    
    masks = digits[digitI].masks
    newMask = {value: "*"}

    if i > -1
      masks.splice(i + 1, 0, newMask)
    else
      masks.push newMask
    
    digits[digitI].masks = masks
   
    @model.set App.Formbuilder.options.mappings.DIGITS, digits
    @model.trigger "change:#{App.Formbuilder.options.mappings.DIGITS}"
    #    @forceRender()
    @render() # не понятно зачем это нужно, триггер не срабатывает?

  removeMask: (e) ->
    $el = $(e.currentTarget)
    
    digitI = @$el.find('.digit').index($el.closest('.digit'))
    index = @$el.find(".js-remove-mask").index($el)
    digits = @model.get(App.Formbuilder.options.mappings.DIGITS)
    
    masks = digits[digitI].masks
    masks.splice index, 1
    
    digits[digitI].masks = masks

    @model.set App.Formbuilder.options.mappings.DIGITS, digits
    @model.trigger "change:#{App.Formbuilder.options.mappings.DIGITS}"
    #    @forceRender()
    @render() # не понятно зачем это нужно, триггер не срабатывает?
