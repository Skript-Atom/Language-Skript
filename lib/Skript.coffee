SkriptView = require './Skript-view'
codesuggestionschecked = true
{CompositeDisposable} = require 'atom'

module.exports = Skript =
  SkriptView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @SkriptView = new SkriptView(state.SkriptViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @SkriptView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add('atom-workspace', {
      'Skript:toggle': => @toggle()
      })

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @SkriptView.destroy()

  serialize: ->
    SkriptViewState: @SkriptView.serialize()

  toggle: ->
    console.log 'Skript was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
