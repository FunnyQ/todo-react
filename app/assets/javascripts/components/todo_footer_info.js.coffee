@TodoFooterInfo = React.createClass
  displayName: 'TodoFooterInfo'

  render: ->
    <div className="todos-info-wrapper">
      <span>已完成：<span>{@props.completed}</span> | 進行中：<span>{@props.working}</span></span>
    </div>
