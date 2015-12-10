module.exports =
class SkriptView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('Skript')

    # Create message element
    message = document.createElement('div')
    message.textContent = "Skript by tim740 +more, has Loaded!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
