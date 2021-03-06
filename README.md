emacs-config
============

My emacs config, complete with automatic install of packages.

Some things to note

* Marmalade is included as a package repo and a set of packages are
  automatically installed at startup if they are not already installed.  See
  `init/my-packages.el` for details.
* We're aiming to be modular, so any config that is beyond setting simple
  configuration items is encapsulated in a separate .el file and loaded by
  init.el.  Config modules are in the `init` subdirectory.
* Operating system specific configuration goes in its own module, which is
  conditionally loaded at startup depending on which OS emacs detects.
