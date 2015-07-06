@Todo = React.createClass
  displayName: 'Todo'

  getInitialState: ->
    completed: @props.todo.completed

  toggleCompleted: (e)->
    @setState
      completed: !@state.completed
    $.ajax
      method: 'PUT'
      url: "todos/#{@props.todo.id}"
      data:
        todo:
          completed: !@state.completed
      dataType: 'JSON'
      success: (data) =>
        @props.handleToggleComplete @props.todo, data

  deleteTodo: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "todos/#{@props.todo.id}"
      dataType: 'JSON'
      success: (data) =>
        @props.handleDeleteTodo @props.todo

    # todo = @props.todo
    # handleDeleteTodo = @props.handleDeleteTodo

    # sendRequest = ->
    #   $.ajax
    #     method: 'DELETE'
    #     url: "todos/#{todo.id}"
    #     dataType: 'JSON'
    #     success: (data) =>
    #       handleDeleteTodo todo

    # swal {
    #   title: '確定要刪除嗎？'
    #   text: '這個操作將無法復原！'
    #   type: 'warning'
    #   showCancelButton: true
    #   confirmButtonColor: '#DD6B55'
    #   confirmButtonText: '刪除'
    #   cancelButtonText: '取消'
    # }, (isConfirm) ->
    #   if isConfirm
    #     sendRequest()
    #   else
    #     return
    #   return


  render: ->
    wrapperClasses = classNames
      'trans-03s': true
      'completed': @state.completed

    <li className={wrapperClasses}>
      <input type="checkbox" name="test1" id="test1" className="todo-toggle" checked={@state.completed} onChange={@toggleCompleted} />
      <label className="todo-title">{@props.todo.title}</label>
      <button className="delete-btn trans-03s" onClick={@deleteTodo}>✖️</button>
    </li>
