@Todos = React.createClass
  displayName: 'Todos'

  render: ->
    <div className="todos-wrapper">
      <h1 className="todos-title">TODO</h1>

      <div className="new-todo-form-wrapper">
        <TodoInput />
      </div>

      <div className="todos-list-wrapper">
        <ul>
          <Todo />
        </ul>
      </div>

      <TodoFooterInfo />
    </div>
