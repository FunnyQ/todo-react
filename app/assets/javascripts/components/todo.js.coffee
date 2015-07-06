@Todo = React.createClass
  displayName: 'Todo'

  render: ->
    <li>
      <input type="checkbox" name="test1" id="test1" className="todo-toggle" />
      <label className="todo-title">學會 React.js</label>
      <button className="delete-btn trans-03s">✖️</button>
    </li>
