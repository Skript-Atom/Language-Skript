atomSkriptDarkView = require './atom-skript-dark-view'
{CompositeDisposable} = require 'atom'

module.exports = atomSkriptDark =
  atomSkriptDarkView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomSkriptDarkView = new atomSkriptDarkView(state.atomSkriptDarkViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomSkriptDarkView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-skript-dark:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomSkriptDarkView.destroy()

  serialize: ->
    atomSkriptDarkViewState: @atomSkriptDarkView.serialize()

  toggle: ->
    console.log 'atomSkriptDark was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
