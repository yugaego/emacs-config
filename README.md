Getting Started on Mac
===

Based on Emacs 26.3 and Emacs 27.1 available at https://emacsformacosx.com.


Install
---

- Emacs 27: `$ brew install jansson`

- `$ brew cask install emacs`

- `$ brew upgrade homebrew/cask/emacs`

- `$ brew cask info homebrew/cask/emacs`

- `$ brew info emacs shows dependencies`

[More on Mac OS installers.](https://www.emacswiki.org/emacs/EmacsForMacOS)

With such install, Emacs works basically the same way other applications work, responding to key presses most of the users are used to (for example, quitting *Cmd-q* or hiding *Cmd-h* Emacs, basic text navigation with the *arrows*, editing  with *Cmd-c*, *Cmd-v*, *Cmd-a*).

And by the way, Emacs usage is smooth with *Dvorak* and a split keyboard. I use [Kinesis Advantage](https://kinesis-ergo.com/shop/advantage2/) and have a set of modifier keys [under each of my hands](https://gitlab.com/-/snippets/1744636).


Legend
---

- **C** Control key
- **M** Meta/Option/Alt/Esc key
- **s** Super/Command key
- **S** Shift key

**Example:**  
**C-g**  
Press and hold **Control** key, press key **g**, release.  
This is a useful combination that cancels the current command input.


Documentation in Emacs
---

### Manual / Help

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|--------------------------
C-h t        | F1 t           | help-with-tutorial  | Open Emacs tutorial
C-h ?        | C-h C-h, F1    | help-for-help       | Help me with the Help
C-h r        | F1-r           | info-emacs-manual   | Open/show Emacs docs in Info mode
C-h v        | F1-v           | describe-variable   | Explain variable
C-h f        | F1-f           | describe-function   | Explain function
C-h k        | F1-k           | describe-key        | Explain pressed keys combination/binding
C-h a        | F1-a           | apropos-command     | Show commands that match word/words/regexp


### Info Mode

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms
-------------|----------------|---------------------|--------------------------
h            |                | Info-help           | Enter/open Info tutorial
q            |                | quit-window         | Exit/close Info, return to previous buffer
?            |                | Info-summary        | Help with Info commands
SPC          |                | Info-scroll-up      | Scroll forward one screen
DEL          |                | Info-scroll-down    | Scroll backward one screen
TAB          |                | Info-next-reference | Move cursor to the next menu item or cross-reference
S-TAB        |                | Info-prev-reference | Move cursor to the previous menu item or link
n            |                | Info-next           | Go to the next sibling node
p            |                | Info-prev           | Go to the previous sibling node
l            |                | Info-history-back   | Go to the last visited node
L            |                | Info-history        | Show visited nodes
u            |                | Info-up             | Go to the parent node, one level up
m            |                | Info-menu           | Go to the node by the menu item name
M-x info-apropos|             | info-apropos        | Search term in all Info files


### Bookmarks

 Key Binding | Alternate Keys | M-x Command         | Notes and Search Terms                      
-------------|----------------|---------------------|--------------------------------------------
C-x r m      |                | bookmark-set        | Set a bookmark at the current location
C-x r b      |                | bookmark-jump       | Jump to a bookmark
C-x r l      |                | bookmark-bmenu-list | Display a list of existing bookmarks
M-x bookmark-delete|          | bookmark-delete     | Remove a bookmark by name


