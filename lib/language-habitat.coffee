LanguageHabitatView = require './language-habitat-view'
{CompositeDisposable} = require 'atom'

module.exports = LanguageHabitat =
  languageHabitatView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @languageHabitatView = new LanguageHabitatView(state.languageHabitatViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @languageHabitatView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'language-habitat:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @languageHabitatView.destroy()

  serialize: ->
    languageHabitatViewState: @languageHabitatView.serialize()

  toggle: ->
    console.log 'LanguageHabitat was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
