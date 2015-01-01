class App.Formbuilder
  @options:
    BUTTON_CLASS: 'fb-button'
    HTTP_ENDPOINT: ''
    HTTP_METHOD: 'POST'
    AUTOSAVE: true
    CLEAR_FIELD_CONFIRM: false

    mappings:
      SIZE: 'field_options.size'
      UNITS: 'field_options.units'
      LABEL: 'label'
      FIELD_TYPE: 'field_type'
      REQUIRED: 'required'
      ADMIN_ONLY: 'admin_only'
      OPTIONS: 'field_options.options'
      DIGITS: 'field_options.digits'
      MASKS: 'field_options.masks'
      DESCRIPTION: 'field_options.description'
      INCLUDE_OTHER: 'field_options.include_other_option'
      INCLUDE_BLANK: 'field_options.include_blank_option'
      INTEGER_ONLY: 'field_options.integer_only'
      MIN: 'field_options.min'
      MAX: 'field_options.max'
      MINLENGTH: 'field_options.minlength'
      MAXLENGTH: 'field_options.maxlength'
      LENGTH_UNITS: 'field_options.min_max_length_units'

    dict:
      ALL_CHANGES_SAVED: 'All changes saved'
      SAVE_FORM: 'Save form'
      UNSAVED_CHANGES: 'You have unsaved changes. If you leave this page, you will lose those changes!'

  @fields: {}
  @inputFields: {}
  @nonInputFields: {}

  @helpers:
    defaultFieldAttrs: (field_type) ->
      attrs = {}
      attrs[App.Formbuilder.options.mappings.LABEL] = 'Untitled'
      attrs[App.Formbuilder.options.mappings.FIELD_TYPE] = field_type
      attrs[App.Formbuilder.options.mappings.REQUIRED] = true
      attrs['field_options'] = {}
      App.Formbuilder.fields[field_type].defaultAttributes?(attrs) || attrs

    simple_format: (x) ->
      x?.replace(/\n/g, '<br />')

  @registerField: (name, opts) ->
    for x in ['view', 'edit']
      opts[x] = _.template(opts[x])

    opts.field_type = name

    App.Formbuilder.fields[name] = opts

    if opts.type == 'non_input'
      App.Formbuilder.nonInputFields[name] = opts
    else
      App.Formbuilder.inputFields[name] = opts

  @editViewFactory: (model, parentView) ->

    switch model.attributes[App.Formbuilder.options.mappings.FIELD_TYPE]
      when "text"
        new App.EditFieldView
          model: model
          parentView: parentView
      when "dropdown"
        new App.EditDropdownView
          model: model
          parentView: parentView
      when "oplata_mts"
        new App.EditDigitsSectionView
          model: model
          parentView: parentView
      else
        new App.EditFieldView
          model: model
          parentView: parentView

  constructor: (opts={}) ->
    _.extend @, Backbone.Events
    args = _.extend opts, {formBuilder: @}
    @mainView = new App.BuilderView args

window.Formbuilder = App.Formbuilder
#
#if module?
#  module.exports = App.Formbuilder
#else
#  window.Formbuilder = App.Formbuilder
