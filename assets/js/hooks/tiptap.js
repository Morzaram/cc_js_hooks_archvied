export let TipTap = {
  // data: "",
  // debounceCall: _debounce(function(data){this.sendHTML(data)}, 1000, { 'maxWait': 1000 }),

  mounted() {
   window.textEditorHook = this
  },
  updated(){
    console.log('U');
  },
  sendHTML(data){
    this.pushEventTo(this.el.phxHookId, 'text-editor', {text_content: data})
  },
  disconnected(){
    window.textEditorHook.delete
  },
  reconnected(){
    if (!window.textEditorHook){
      window.textEditorHook = this
    }
  
  }
}




