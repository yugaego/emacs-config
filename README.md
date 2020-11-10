Getting Started on Mac
===

Based on Emacs 26.3 and Emacs 27.1 available at [https://emacsformacosx.com](EmacsForMacOSX).


Install
---

- `$ brew cask install emacs`

This command is sufficient to get a working Emacs application. With such install, Emacs works basically the same way as other applications work, responding to key presses most of the users are used to (for example, quitting Emacs with **Cmd-q** or hiding with **Cmd-h**, making basic text navigation with the **arrows**, editing  with **Cmd-c**, **Cmd-v**, **Cmd-a**, **Cmd-x**, etc).

[More on Mac OS installers](https://www.emacswiki.org/emacs/EmacsForMacOS).

- Upgrade: `$ brew upgrade homebrew/cask/emacs`

- Info: `$ brew cask info homebrew/cask/emacs`

And by the way, Emacs usage is smooth with *Dvorak* layout and a split keyboard. I use [Kinesis Advantage](https://kinesis-ergo.com/shop/advantage2/) and have a set of modifier keys [under each of my hands](https://gitlab.com/-/snippets/1744636).


What's Next
---

As the next step, I highly recommend following the **Emacs tutorial**, then reading the **Emacs manual**.  
I also found [EmacsWiki](https://www.emacswiki.org/emacs/EmacsNewbie) to be the most helpful resource online.

Experiment while reading documentation. Be patient!  
For example, it took me two months to read the manual and get used to Emacs. To that moment I wrote the simplest possible configuration file that matched my tastes. You can see it tagged as `bare-bones`.  
Some may say it took too much time, but that was a time full of joy. I'm still in the mid of the process of configuring Emacs for my needs, so I realize it's really a long time journey. If you're like me and many other people that like what Emacs has to suggest, that's going to be a very pleasant journey, despite being not the easiest one sometimes. So good luck!

**Several key bindings listed below helped me the most while getting into Emacs.** The file *KeyBindings.md* contains the extended list of such key bindings.


### Legend


- **C** Control key
- **M** Meta/Option/Alt/Esc key
- **s** Super/Command key
- **S** Shift key

**Example:**  
**C-g**  
Press and hold **Control** key, press key **g**, release.  
This is a useful combination that **cancels the current command input**.


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

 Key Binding |  M-x Command         | Notes and Search Terms
-------------|----------------------|--------------------------
h            | Info-help           | Enter/open Info tutorial
q            | quit-window         | Exit/close Info, return to previous buffer
?            | Info-summary        | Help with Info commands
SPC          | Info-scroll-up      | Scroll forward one screen
DEL          | Info-scroll-down    | Scroll backward one screen
TAB          | Info-next-reference | Move cursor to the next menu item or cross-reference
S-TAB        | Info-prev-reference | Move cursor to the previous menu item or link
n            | Info-next           | Go to the next sibling node
p            | Info-prev           | Go to the previous sibling node
l            | Info-history-back   | Go to the last visited node
L            | Info-history        | Show visited nodes
u            | Info-up             | Go to the parent node, one level up
m            | Info-menu           | Go to the node by the menu item name
M-x info-apropos| info-apropos     | Search term in all Info files


### Bookmarks

 Key Binding | M-x Command         | Notes and Search Terms
-------------|---------------------|------------------------------------
C-x r m      | bookmark-set        | Set a bookmark at the current location
C-x r b      | bookmark-jump       | Jump to a bookmark
C-x r l      | bookmark-bmenu-list | Display a list of existing bookmarks
M-x bookmark-delete| bookmark-delete | Remove a bookmark by name

