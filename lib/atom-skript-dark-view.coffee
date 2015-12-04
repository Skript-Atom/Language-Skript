module.exports =
class atomSkriptDarkView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('atom-skript-dark')

    # Create message element
    message = document.createElement('div')
    message.textContent = "SkriptDark by tim740 +more, has Loaded!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
