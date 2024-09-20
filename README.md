# My own Gentoo Overlay

Welcome to my set of packages for [Gentoo](https://www.gentoo.org/) Linux.

# Using

The overlay is not on the repository list yet.

So, the only way of using it at the moment is by adding a file to `/etc/portage/repos.conf/` containing:
```
[lamdness]
priority = 50
location = /opt/portage/lamdness
sync-type = git
sync-uri = https://github.com/grouzen/lamdness-overlay.git
auto-sync = Yes
```

# Available packages

```
├── acct-group
│   └── ollama
├── acct-user
│   └── ollama
├── app-misc
│   └── ollama-bin
├── dev-rust
│   ├── aichat
│   ├── impala
│   ├── qv
│   └── tenere
├── net-vpn
│   └── globalprotect-openconnect
└── sys-process
    └── pik
```

Enjoy!

