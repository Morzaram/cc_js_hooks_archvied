defmodule ClimateCoolersWeb.Live.ComponentsLive.TipTap do
  use ClimateCoolersWeb, :live_component

  def render(assigns) do
    ~H"""
    <div id="editor" class="editor" phx-update="ignore" >
        <div x-data={"editor(`#{@text}`)"}>
        <div class="editor-menu-bubble">
          <button
            type="button"
            @click="toggleBold()"
            :class="{ 'is-active' : isActive('bold', updatedAt) }"
            title="Bold"
            >
            Bold
          </button>
          <button
            type="button"
            @click="toggleItalic()"
            :class="{ 'is-active' : isActive('italic', updatedAt) }"
            title="Italic"
            >
            Italic
          </button>
          <button
            type="button"
            @click="toggleUnderline()"
            :class="{ 'is-active' : isActive('underline', updatedAt) }"
            title="Underline"
            >
            Underline
          </button>
          <button
            type="button"
            @click="toggleCode()"
            :class="{ 'is-active' : isActive('code', updatedAt) }"
            title="Inline Code"
            >
            Inline Code
          </button>
        </div>

        <div class="editor-menu-floating">
          <button
            type="button"
            @click="setParagraph()"
            :class="{ 'is-active' : isActive('paragraph', updatedAt) }"
            title="Paragraph"
            >
            Paragraph
          </button>
          <button
            type="button"
            @click="toggleHeading(2)"
            :class="{ 'is-active' : isActive('heading', { level: 2 }, updatedAt) }"
            title="Heading 2"
            >
            Heading 2
          </button>
          <button
            type="button"
            @click="toggleHeading(3)"
            :class="{ 'is-active' : isActive('heading', { level: 3 }, updatedAt) }"
            title="Heading 3"
            >
            Heading 3
          </button>
        </div>

        <div class="editor-menu-fixed centered narrow">
          <div class="editor-menu-group">
            <button type="button" @click="undo()" title="Undo">Undo</button>
            <button type="button" @click="redo()" title="Redo">Redo</button>
            <button type="button" @click="clearMarkup()" title="Clear all markup of selection">Clear all markup of selection</button>
          </div>
          <div class="editor-menu-group">
            <button
              type="button"
              @click="setParagraph()"
              :class="{ 'is-active' : isActive('paragraph', updatedAt) }"
              title="Paragraph"
              >
              Paragraph
            </button>
            <button
              type="button"
              @click="toggleHeading(2)"
              :class="{ 'is-active' : isActive('heading', { level: 2 }, updatedAt) }"
              title="Heading 2"
              >
              Heading 2
            </button>
            <button
              type="button"
              @click="toggleHeading(3)"
              :class="{ 'is-active' : isActive('heading', { level: 3 }, updatedAt) }"
              title="Heading 3"
              >
              Heading 3
            </button>
          </div>

          <div class="editor-menu-group">
            <button
              type="button"
              @click="toggleBold()"
              :class="{ 'is-active' : isActive('bold', updatedAt) }"
              title="Bold"
              >
              Bold
            </button>
            <button
              type="button"
              @click="toggleItalic()"
              :class="{ 'is-active' : isActive('italic', updatedAt) }"
              title="Italic"
              >
              Italic
            </button>
            <button
              type="button"
              @click="toggleUnderline()"
              :class="{ 'is-active' : isActive('underline', updatedAt) }"
              title="Underline"
              >
              Underline
            </button>
            <button
              type="button"
              @click="toggleStrike()"
              :class="{ 'is-active' : isActive('strike', updatedAt) }"
              title="Strikethrough"
              >
              Strikethrough
            </button>
            <button
              type="button"
              @click="toggleHighlight('#fffb91')"
              :class="{ 'is-active' : isActive('highlight', { color: '#fffb91' }, updatedAt) }"
              title="Highlight"
              >
              Highlight <span style="background: #fffb91; height: 1rem; width: 1rem; border: 1px solid grey; display: inline-block;"></span>
            </button>
            <button
              type="button"
              @click="toggleHighlight('#94fa9a')"
              :class="{ 'is-active' : isActive('highlight', { color: '#94fa9a' }, updatedAt) }"
              title="Highlight"
              >
              Highlight <span style="background: #94fa9a; height: 1rem; width: 1rem; border: 1px solid grey; display: inline-block;"></span>
            </button>
            <button
              type="button"
              @click="toggleSubscript()"
              :class="{ 'is-active' : isActive('subscript', updatedAt) }"
              title="Subscript"
              >
              Subscript
            </button>
            <button
              type="button"
              @click="toggleSuperscript()"
              :class="{ 'is-active' : isActive('superscript', updatedAt) }"
              title="Superscript"
              >
              Superscript
            </button>
            <button
              type="button"
              @click="toggleCode()"
              :class="{ 'is-active' : isActive('code', updatedAt) }"
              title="Inline Code"
              >
              Inline Code
            </button>
          </div>

          <div class="editor-menu-group">
            <button
              type="button"
              @click="toggleCodeBlock()"
              :class="{ 'is-active' : isActive('codeBlock', updatedAt) }"
              title="Code Block"
              >
              Code Block
            </button>
            <button
              type="button"
              @click="toggleBlockquote()"
              :class="{ 'is-active' : isActive('blockquote', updatedAt) }"
              title="Blockquote"
              >
              Blockquote
            </button>
          </div>
          <div class="editor-menu-group">
            <button
              type="button"
              @click="toggleBulletList()"
              :class="{ 'is-active' : isActive('bulletList', updatedAt) }"
              title="Bullet List"
              >
              Bullet List
            </button>
            <button
              type="button"
              @click="toggleOrderedList()"
              :class="{ 'is-active' : isActive('orderedList', updatedAt) }"
              title="Ordered List"
              >
              Ordered List
            </button>
          </div>

          <div class="editor-menu-group">
            <button
              type="button"
              @click="addFigure()"
              title="Image"
              >
              Image
            </button>
          </div>

          <div class="editor-menu-group">
            <button
              type="button"
              @click="setHorizontalRule()"
              title="Horizontal Rule"
              >
              Horizontal Rule
            </button>
            <button
              type="button"
              @click="setHardBreak()"
              title="Hard Break"
              >
              Hard Break
            </button>
          </div>
        </div>

        <div x-ref="editorReference" class="editor-output"></div>
        </div>

        <%= hidden_input @form, @field, id: "editor_input" %>

        <script>
        document.querySelector("#editor").addEventListener('keydown', function (event) {
            if (event.key === 's' && (event.ctrlKey || event.metaKey)) {
              console.log('Firing')
              event.preventDefault()
              document.querySelector("#save").click();
            }
          });
        </script>
      </div>
    """
  end
end
