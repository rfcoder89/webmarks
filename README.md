# webmarks

Webmarks is a small emacs lisp module for storing and quickly navigating
to websites in an external browser.

The library uses ivy to provide narrowing completion.

### Installation

Start by cloning the *webmarks* repository

`$ git clone https://github.com/rfcoder89/webmarks.git /your/path/here/webmarks`

Then create a webmarks.json file which will hold all your bookmarks.  You will be able to
add to this file from within emacs in the near future.

The webmarks.json file should look like this:

```
{
  "Google": "https://www.google.com",
  "Facebook": "https://www.facebook.com"
}
```
  
Then inside your emacs configuration file you can set it up like so:

```
(add-to-list 'load-path "/your/path/here/webmarks")
(require 'webmarks)
(setq webmarks-file "/path/to/webmarks.json")
(webmarks-reload)
```

Firstly make sure you have ivy installed then if
you invoke `M-x webmarks-list` you can search through your bookmarks
and open them quickly.

You might want to bind this command to something useful.

```
(global-set-key (kbd "C-x C-n") 'webmarks-list)
```

### Todos

  - Add and remove webmarks on the fly

### License

MIT