@Todo = React.createClass
  displayName: 'Todo'

  render: ->
    <li className="trans-03s">
      <input type="checkbox" name="test1" id="test1" className="todo-toggle" />
      <label className="todo-title">{@props.todo.title}</label>
      <button className="delete-btn trans-03s">✖️</button>
    </li>
