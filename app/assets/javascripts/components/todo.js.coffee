@Todo = React.createClass
  displayName: 'Todo'

  getInitialState: ->
    completed: @props.todo.completed

  toggleCompleted: (e)->
    @setState(completed: !@state.completed)

  render: ->
    wrapperClasses = classNames
      'trans-03s': true
      'completed': @state.completed

    <li className={wrapperClasses}>
      <input type="checkbox" name="test1" id="test1" className="todo-toggle" checked={@state.completed} onChange={@toggleCompleted} />
      <label className="todo-title">{@props.todo.title}</label>
      <button className="delete-btn trans-03s">✖️</button>
    </li>
