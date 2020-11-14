Key Bindings
===

Use `C-u NUMBER` or `M-NUMBER` as a command prefix to send a numeric argument to the command.

In an attempt to be useful for newbies, this page uses mixed terms, not only [Emacs Jargon](https://www.emacswiki.org/emacs/EmacsJargon) usual ones.


### Text: Navigate

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms 
-------------|----------------|---------------------|-------------------------------------
C-f          | RIGHT          | forward-char (right-char)| Move forward one character
C-b          | LEFT           | backward-char (left-char)| Move backward one character
C-n          | DOWN           | next-line           | Move cursor down
C-p          | UP             | previous-line       | Move cursor up
C-a          |                | move-beginning-of-line| Move cursor to beginning of current line
C-e          |                | move-end-of-line    | Move cursor to end of current line
C-v          | PageDOWN       | scroll-up           | Scroll one screen forward
M-f          |                | forward-word        | Move forward one word
M-b          | LEFT           | backward-word       | Move backward one word
M-a          |                | backward-sentence   | Move backward to start of sentence
M-e          |                | forward-sentence    | Move forward to end of sentence
M-<          | HOME           | beginning-of-buffer | Move to the top
M->          | END            | end-of-buffer       | Move to the end
M-v          | PageUP         | scroll-down-command | Scroll one screen backward
M-g g (M-g-g)| s-l, M-g M-g   | goto-line           | Move to line number N
M-g TAB      |                | move-to-column      | Move to column N in the current line
M-r          |                | move-to-window-line-top-bottom| Move to top / center / bottom of window
M-}          |                | forward-paragraph   | Move forward to end of paragraph
M-{          |                | backward-paragraph  | Move backward to start of paragraph


### Text: Delete

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
DELETE       | C-d (delete-char) | delete-forward-char| Remove the following character
BACKSPACE    |                | delete-backward-char| Remove the previous character
M-d (custom M-DELETE)|C-DELETE| kill-word           | Delete the word or its remaining part
M-BACKSPACE  | C-BACKSPACE    | backward-kill-word  | Remove the previous word
C-k          |                | kill-line           | Remove the remaining part of the line
C-S-BACKSPACE|                | kill-whole-line     | Delete current line
M-k          |                | kill-sentence       | Delete from point to end of sentence
C-x BACKSPACE|                | backward-kill-sentence| Delete from point to start of sentence
C-w          | s-x            | kill-region         | Cut selected text
C-M-w        |                | append-next-kill    | If following command kills, add result to previous kill
C-x C-o      |                | delete-blank-lines  | Delete blank lines
M-^          |                | delete-indentation  | Join this line to previous
M-z          |                | zap-to-char         | Delete up to and including a character
M-\          |                | delete-horizontal-space| Remove all spaces around cursor
M-SPACE      |                | just-one-space  | Remove all spaces except one around cursor


### Text: Edit

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
M-w          |                | kill-ring-save      | Copy selected text
C-y          | s-v            | yank                | Paste text
M-y          |                | yank-pop            | Replace just-yanked text
C-o          |                | open-line           | Insert a new line after cursor
C-x u        | s-z, C-_, C-/  | undo                | Undo previous changes
C-t          |                | transpose-chars     | Interchange / swap chars
M-t          |                | transpose-words     | Interchange / swap words
C-x C-t      |                | transpose-lines     | Interchange / swap lines
M-u          |                | upcase-word         | Convert to upper case forward
M-l          |                | downcase-word       | Convert to lower case forward
M-c          |                | capitalize-word     | Capitalize forward
C-q          |                | quoted-insert       | Read next input and insert it. `C-j` inserts newline


### Editor

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x C-0      | s-0, s-+, s--  | text-scale-adjust   | Change height of the face (font)
M-x highlight-changes-mode | | highlight-changes-mode| Toggle highlighting of changes
M-x semantic-mode |           | semantic-mode       | Toggle semantic mode: completion etc


### Select / Mark Region

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-@          |                | set-mark-command    | Set and activate mark / selection
C-x C-x      | s-j            | exchange-point-and-mark| Swap positions of the cursor and mark
C-@ C-@      |                |                     | Remember position (set and unset mark) (see `C-u C-@`)
C-u C-@      |                |                     | Return to marked position (see `C-@ C-@`)
M-h          |                | mark-paragraph      | Select current paragraph
C-x h        | s-a            | mark-whole-buffer   | Select current buffer contents
S-NAVIGATION-KEYS | | | Shift selection: hold down shift key and type cursor motion commands


### Region (Selection) Edit

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
Apply text manipulation commands| | |
C-x C-u      |                | upcase-region       | Convert selection to upper case
C-x C-l      |                | downcase-region     | Convert selection to lower case
C-M-\        |                | indent-region       | Indent non-blank lines in the selection
C-x TAB      | | indent-rigidly      | Indent all selected lines, using LEFT/RIGHT and SHIFT or `C-u NUMBER`
M-;          | C-x C-;  | comment-dwim, comment-line| Toggle commenting out the selection
M-s M-w      |                | eww-search-words    | Search the web for the selected text


### Search: Start / Stop

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-s          | s-f            | isearch-forward     | Search text forward, `C-u` for regexp
C-M-s        |                | isearch-forward-regexp| Search regular expression forward
C-r          |                | isearch-backward    | Search text backward, `C-u` for regexp
M-C-r        |                | isearch-backward-regexp| Search regular expression backward
RETURN       |                |                     | Stop searching, stay at the found location
C-g          |                |                     | Stop searching, move to the initial position
M-s h r      |                | highlight-regexp    | Stop searching, highlight all matches
M-s h l | | highlight-lines-matching-regexp    | Stop searching, highlight lines with the matches
M-s h u | |     | Disable highlighting


### Search: Use

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-h C-h      |                |                     | Enable search help mode
M-p          |                |                     | Insert previous search string
M-n          |                |                     | Insert next search string
M-TAB        |                |                     | Show completion list
M-s e        | M-e            |                     | Edit search string
M-s c        | M-c            |                     | Toggle search case-sensitivity
M-s r        | M-r            |                     | Toggle regular-expression mode
M-s w        |                |                     | Toggle word mode
M-%          |                | query-replace       | Switch to replace
C-M-%        |                | query-replace-regexp| Switch to regexp replace


### Replace: Start / Stop

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
M-%          |                | query-replace       | Replace string occurrences
C-M-%        |                | query-replace-regexp| Replace regular expression occurrences
q            | RETURN         |                     | Exit replace
.            |                |                     | Replace this match and exit


### Replace: Use

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
?            | C-h            |                     | Show replace help
y            | SPACE          |                     | Do replace this match
n            | BACKSPACE (DEL)|                     | Skip this match
!            |                |                     | Replace all remaining matches in this buffer


### Buffers

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x C-b      || list-buffers, ibuffer, buffer-menu| Show a list of all existing buffers
C-u C-x C-b  || list-buffers, buffer-menu| List buffers that are visiting files
?            | h              |                     | Show available buffers list/menu commands
C-x b        |                | switch-to-buffer    | Show another buffer (by name)
C-x LEFT     |                | previous-buffer     | Show previous buffer
C-x RIGHT    |                | next-buffer         | Show next buffer
C-x 4 b      |                | switch-to-buffer-other-window| Show buffer in another window
C-x 5 b      |                | switch-to-buffer-other-frame| Show buffer in another frame
C-x k        |                | kill-buffer         | Close/kill buffer (by name), optionally save
M-x kill-some-buffers|        | kill-some-buffers   | Close/kill (or not) buffers one by one, optionally save
M-x kill-matching-buffers|    | kill-matching-buffers| Close/kill buffers with matching names
M-x clone-buffer|| clone-buffer| Clone buffer using a new name. View different \*info\* or \*Help\* pages simultaneously
M-x bs-show  |                | bs-show             | Open menu of buffers for immediate manipulations
C-x C-q      |                | read-only-mode      | Toggle buffer read only mode
M-x bs-show  |                | bs-show             | Open menu of buffers for immediate manipulatins


### Files

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x C-f      |                | find-file           | Open a file or switch to buffer if already opened
C-x C-w      |                | write-file          | Save as
C-x C-r      |                | find-file-read-only | Open a file in a read only mode (see `C-x C-q`)
C-x C-v || find-alternate-file | Open a file instead of previously opened one (or refresh/reload/revert by using the same file name)
C-x 4 C-f    | C-x 4 f        | find-file-other-window| Open a file in another window
C-x 5 C-f    | C-x 5 f        | find-file-other-frame | Open a file in another frame
C-x C-s      | s-s            | save-buffer         | Save file shown in the current buffer (`C-u` to backup)
C-x s        | | save-some-buffers | Save interactively file-visiting buffers (`C-h` for help). Called on Emacs exit
s-u          |                | revert-buffer       | Reload file from disk (undo all unsaved changes)
M-x diff-buffer-with-file | | diff-buffer-with-file | View the differences between buffer and disk contents
M-x find-file-at-point |      | find-file-at-point  | Open file guessing default from text around point


### Directories

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x C-d      |                | list-directory      | Brief listing
C-x d        | s-D            | dired               | Directory browing and editing major mode
C-x 4 d      |                | dired-other-window  | Enter dired mode in another window
C-x 5 d      |                | dired-other-frame   | Enter dired mode in another frame
h            |                |                     | When in **Dired** mode, show help (list available commands)
M-x find-name-dired |         | find-name-dired     | List files with names matching a pattern
M-x find-grep-dired |         | find-grep-dired     | List files with content matching a regexp


### Windows

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x 2        |                | split-window-below  | Create window with the same buffer below the current window
C-x 3        |                | split-window-right  | Split current window into two side-by-side windows
C-x o        |                | other-window        | Switch to another (next) window in cyclic order
C-M-v        |                | scroll-other-window | Scroll next (another) window forward
C-M-S-v      |                | scroll-other-window-down| Scroll next (another) window backward
C-x 1        |                | delete-other-windows| Expand current window, close other windows in this frame
C-x 0        |                | delete-window       | Close current window
C-x 4 0      |                | kill-buffer-and-window| Close current window and kill current buffer
C-x ^        |                | enlarge-window      | Make current window N lines taller
C-x -        || shrink-window-if-larger-than-buffer | Make current window smaller if buffer doesn't need so many lines
C-x +        |                | balance-windows     | Make windows to be of equal height
C-x }        |                | enlarge-window-horizontally| Make current window N columns wider
C-x {        |                | shrink-window-horizontally| Make current window N columns narrower


### Frames

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x C-c | | save-buffers-kill-terminal| Closes all frames on current display, then ends Emacs session if has no frames open on other displays
C-x 5 0      | s-w            | delete-frame        | Delete current frame
C-x 5 1      |                | delete-other-frames | Delete all frames except current
M-F10        | ESC F10        | toggle-frame-maximized| Toggle maximization state of current frame
C-x 5 o      | s-`            | other-frame         | Switch to another frame
C-x 5 2      |                | make-frame-command  | Create a new frame
M-x speedbar |                | speedbar            | Toggle speedbar frame mode (quick access to files)


### Info

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
M-=          | | count-words-region  | Count the number of lines, words, characters in the selection
C-u M-=      | | count-words         | Count the number of lines, words, characters the in buffer
C-x =        | | what-cursor-position| Print cursor position and character information
C-u C-x =    | | what-cursor-position| Print cursor position and character detailed information


### Command Related

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
C-x z, then z|                |                     | Repeat previous command
M-x list-command-history|     | list-command-history| Show list of commands that used the minibuffer
C-u NUMBER   | M-NUMBER | universal-argument  | Begin a numeric argument for the following command. `C-u` equals 4, `C-u C-u` equals `2 * 4`, etc
`C--`        | `M--`, `C-M--` | negative-argument   | Begin a negative numeric argument for the next command
M-!          | s-L            | shell-command       | Execute shell command
M-:          |                | eval-expression     | Evaluate expression

