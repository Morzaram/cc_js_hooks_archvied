<script>
  import { onMount, onDestroy } from "svelte";
  import { Editor } from "@tiptap/core";
  import StarterKit from "@tiptap/starter-kit";
  var _debounce = require("lodash.debounce");

  let element;
  let editor;
  export let content;

  console.log("global");
  let sendHTML = () => {
    textEditorHook.pushEventTo(textEditorHook.el.phxHookId, "text-editor", {
      text_content: editor.getHTML(),
    });
  };
  let debounceCall = _debounce(() => sendHTML(), 1000, { maxWait: 1000 });

  onMount(() => {
    console.log("mounting");
    editor = new Editor({
      element: element,
      extensions: [StarterKit],
      content: content || "<p>Hello World! 🌍️ </p>",
      onTransaction: () => {
        // force re-render so `editor.isActive` works as expected
        debounceCall();
      },
    });
  });

  onDestroy(() => {
    if (editor) {
      editor.destroy();
    }
  });
</script>

<div phx-update="ignore">
  {#if editor}
    <button
      type="button"
      on:click={() => editor.chain().focus().toggleHeading({ level: 1 }).run()}
      class:active={editor.isActive("heading", { level: 1 })}
    >
      H1
    </button>
    <button
      type="button"
      on:click={() => editor.chain().focus().toggleHeading({ level: 2 }).run()}
      class:active={editor.isActive("heading", { level: 2 })}
    >
      H2
    </button>
    <button
      type="button"
      on:click={() => editor.chain().focus().setParagraph().run()}
      class:active={editor.isActive("paragraph")}
    >
      P
    </button>
  {/if}

  <div bind:this={element} />
</div>

<style>
  button.active {
    background: black;
    color: white;
  }
</style>
