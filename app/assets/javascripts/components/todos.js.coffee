@Todos = React.createClass
  displayName: 'Todos'

  # 設定 todos props 的預設值，rails view 忘記塞資料也不會找不到 props
  getDefaultProps: ->
    todos: []

  # 用 todos props 初始化 todos state
  getInitialState: ->
    todos: @props.todos

  render: ->

    # 沒有資料的狀況
    noData =
      <li className="todo-no-data">尚未記錄待辦事項</li>

    # 有資料的話顯示 Todo component
    todoUnit =
      <Todo />

    <div className="todos-wrapper">
      <h1 className="todos-title">TODO</h1>

      <div className="new-todo-form-wrapper">
        <TodoInput />
      </div>

      <div className="todos-list-wrapper">
        <ul>
          {
            console.log(@state.todos)
            if @state.todos.length > 0
              {todoUnit}
            else
              {noData}
          }
        </ul>
      </div>

      <TodoFooterInfo />
    </div>
