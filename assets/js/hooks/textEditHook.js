import Quill from 'quill';
export let TextEditor = {
  mounted() {
    console.log('Mounting');
    let quill = new Quill(this.el, {
      theme: 'snow'
    });

    quill.on('text-change', (delta, oldDelta, source) => {
      if (source == 'api') {
        console.log("An API call triggered this change.");
      } else if (source == 'user') {
        console.log(this);
        this.pushEventTo(this.el.phxHookId, "text-editor", {"text_content": quill.getContents()})
      }
    });
    

  },
  updated(){
    console.log('U');
  }
}
