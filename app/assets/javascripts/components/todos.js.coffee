@Todos = React.createClass
  displayName: 'Todos'

  # 設定 todos props 的預設值，rails view 忘記塞資料也不會找不到 props
  getDefaultProps: ->
    todos: []

  # 用 todos props 初始化 todos state
  getInitialState: ->
    todos: @props.todos

  completedTodosCount: ->
    @state.todos.filter((value) ->
      value.completed == true
    ).length

  workingTodosCount: ->
    @state.todos.length - @completedTodosCount()

  toggleComplete: (todo, data)->
    index = @state.todos.indexOf todo
    todos = React.addons.update(@state.todos, { $splice: [[index, 1, data]] })
    @replaceState todos: todos

  newTodo: (todo) ->
    todos = React.addons.update(@state.todos, { $push: [todo] })
    @setState todos: todos

  render: ->
    <div className="todos-wrapper">
      <h1 className="todos-title">TODO</h1>

      <div className="new-todo-form-wrapper">
        <TodoInput handleNewTodo={@newTodo} />
      </div>

      <div className="todos-list-wrapper">
        <ul>
          {
            if @state.todos.length > 0
              for todo in @state.todos
                <Todo key={todo.id} todo={todo} handleToggleComplete={@toggleComplete} />
            else
              <li className="todo-no-data">尚未記錄待辦事項</li>
          }
        </ul>
      </div>

      <TodoFooterInfo completed={@completedTodosCount()} working={@workingTodosCount()} />
    </div>
