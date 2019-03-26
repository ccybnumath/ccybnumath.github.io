<!--
.. title: 12]A Gentle Introduction to vi
.. slug: 12a-gentle-introduction-to-vi
.. date: 2019-03-27 00:53:42 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

## Why vi?

* available
* lightweight and fast
# Starting And Stopping vi
* start vi
```bash
vi
```
* exiting
```bash
:q
:q!
```
> Tip: If you get “lost” in vi, try pressing the Esc key twice to find your way again.

# Editing and Move
* Entering Add Mode
If we move the cursor to the end of the line and type “a”, the cursor will move past the end of the line and vi will enter insert mode. 
```bash
a
```
* “A” command move to the end of the current line and start appending.
* Saving
```bash
:w
```
* Move
	* l or Right Arrow Right one character.
	* h or Left Arrow Left one character.
	* j or Down Arrow Down one line.
	* k or Up Arrow Up one line.
	* 0 To the beginning of the current line
	* ^ To the first non-whitespace character of the current line.
	* $ To the end of the curren line.
	* `number`G To line `number`
	* G To the last line of the file.
* Opening A Line
	* o The line below the current line.
	* O The line above the current line.
* Deleting Text
	* x The current character
	* dd The current line.
	* dW 
	* d$
	* d0 From the current cursor location to the beginning of the line.
	* dG From the current cursor to the end of the file.
we can later recall
with the p command to paste the contents of the buffer after the cursor or the P command
to paste the contents before the cursor.
* copy: `y`
	* yy The current line.
	* 5yy The current line and the next four lines.
	* yW From the current cursor position to the beginning of the next word.
	* y$
	* y0
	* yG: From the current cursor location to the end of the file.
* replace: `r[]`
* Joining Lines `J`
vi is rather strict about its idea of a line. Normally, it is not possible to move the cursor to the end of a line and delete the end-of-line character to join one line with the one below
* Search-And-Replace
	* f: Searching Within A Line
	> For example, the command fa would move the cursor to the next occurrence of the character “a” within the current line. 
	* /: Searching The Entire File
	* :%s/Line/line/g[c] replace Line with line ,optional [c] means with user confirmation
* replace: `r[]`
* Editing Multiple Files
	```bash
	ls -l /usr/bin > ls-output.txt
	vi foo.txt ls-output.txt
	```
	* `:n` for switching from one file to the next.
	* `:N` for moving back to the previous file use.
	> While we can move from one file to another, vi enforces a policy that prevents us from switching files if the current file has unsaved changes. 
	* `:e ls-output.txt` The ex command :e (short for “edit”) followed by a filename will open an additional file.
	* `:buffers` view a list of files being edited with the :buffers command. 
	* `:buffer 1` for switching
# Inserting An Entire File Into Another
* `:r foo.txt`: The :r command (short for “read”) inserts the specified file before the cursor position
# Further Reading
* [Learning_the_vi_Editor](https://en.wikibooks.org/wiki/Learning_the_vi_Editor
)
