var _debounce = require('lodash.debounce');

export let TipTap = {
  mounted() {
   window.textEditorHook = this
  },
  updated(){
    console.log('U');
  },
  sendText(data) {
    console.log('sendText');
    this.pushEventTo(this.el.phxHookId, 'text-editor', {text_content: data})
  },
  sendDataDebounced(data){
    console.log('sendDD');
    this.debouncedRequest(data)
  },
  debouncedRequest(data){
    console.log('dbr');
    _debounce(() => this.sendText(data), 500, , { 'maxWait': 1000 })
  }
}

