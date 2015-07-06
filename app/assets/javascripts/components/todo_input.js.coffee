@TodoInput = React.createClass
  displayName: 'TodoInput'

  getInitialState: ->
    title: ''

  handleNewTodoKeyDown: (e) ->
    ENTER_KEY = 13
    if e.keyCode != ENTER_KEY
      return

    e.preventDefault()
    newTodoValue = React.findDOMNode(@refs.newField).value.trim()
    $.ajax
      method: 'POST'
      url: '/todos'
      data:
        todo:
          title: newTodoValue
      dataType: 'JSON'
      success: (data) =>
        @props.handleNewTodo data
        React.findDOMNode(@refs.newField).value = ''

  render: ->
    <input className="new-todo-form trans-03s" type="text" placeholder="輸入想完成的事！" autoFocus={true} onKeyDown={@handleNewTodoKeyDown} ref="newField" />
