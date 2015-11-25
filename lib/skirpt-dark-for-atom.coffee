SkirptDarkForAtomView = require './skirpt-dark-for-atom-view'
{CompositeDisposable} = require 'atom'

module.exports = SkirptDarkForAtom =
  skirptDarkForAtomView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @skirptDarkForAtomView = new SkirptDarkForAtomView(state.skirptDarkForAtomViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @skirptDarkForAtomView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'skirpt-dark-for-atom:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @skirptDarkForAtomView.destroy()

  serialize: ->
    skirptDarkForAtomViewState: @skirptDarkForAtomView.serialize()

  toggle: ->
    console.log 'SkirptDarkForAtom was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
