import { AlpineEditor } from "../vendors/editor";

export default {
  mounted() {
    saveEditorHook = this
    const saveButton = this.el.querySelector(".save-button");
    const h1 = this.el.querySelector("h1");

    saveButton.addEventListener("click", () => {
      this.pushEvent("save", {
        title: h1.innerText.trim(),
        content_json: AlpineEditor.getJSON(),
        content_html: AlpineEditor.getHTML(),
      });
    });
  },
  sendHTML(data){
    this.pushEventTo(this.el.phxHookId, 'text-editor', {text_content: data})
  },
};
