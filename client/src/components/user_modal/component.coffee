Ctrl = ->
  ctrl = this
  ctrl.$onInit =->
    if @.mode == 'new'
      @.obj.is_active = true
  ctrl.onSubmit =(form)->
    form.$submitted = true
    if form.$valid
      this.submit({obj: @.obj})

  return

angular.module('client').component 'userModal',
  templateUrl: 'components/user_modal/index.html'
  controller: Ctrl
  bindings:
    submit: "&"
    loading: "="
    toggle: "&"
    obj: "="
    mode: "<"
