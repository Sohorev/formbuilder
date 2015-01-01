class App.EditFieldView extends App.EditAbstractView

  events:
    'click .js-add-mask': 'addMask'
    'click .js-remove-mask': 'removeMask'
    'click .js-default-updated': 'defaultUpdated'
    'input .mask-value-input': 'forceRender'

  # @todo this should really be on the model, not the view
  addMask: (e) ->
    $el = $(e.currentTarget)
    i = @$el.find('.mask').index($el.closest('.mask'))
    masks = @model.get(App.Formbuilder.options.mappings.MASKS) || []
    newMask = {value: "*"}

    if i > -1
      masks.splice(i + 1, 0, newMask)
    else
      masks.push newMask

    @model.set App.Formbuilder.options.mappings.MASKS, masks
    @model.trigger "change:#{App.Formbuilder.options.mappings.MASKS}"
    @forceRender()

  removeMask: (e) ->
    $el = $(e.currentTarget)
    index = @$el.find(".js-remove-mask").index($el)
    masks = @model.get App.Formbuilder.options.mappings.MASKS
    masks.splice index, 1
    @model.set App.Formbuilder.options.mappings.MASKS, masks
    @model.trigger "change:#{App.Formbuilder.options.mappings.MASKS}"
    @forceRender()
