Key Bindings
===

Use `C-u NUMBER` or `M-NUMBER` as a command prefix to send a numeric argument to the command.


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
C-@ C-@      |                |                     | Remember position (set and unset mark) (see C-u C-@)
C-u C-@      |                |                     | Return to marked position (see C-@ C-@)
M-h          |                | mark-paragraph      | Select current paragraph
C-x h        | s-a            | mark-whole-buffer   | Select current buffer contents
S-NAVIGATION-KEYS | | | Shift selection: hold down shift key and type cursor motion commands


### Region (Selection) Edit

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|------------------------------------
Apply text manipulation commands| | |
C-x C-u      |                | upcase-region       | Convert selection to upper case
C-x C-l      |                | downcase-region     | Convert selection to lower case
