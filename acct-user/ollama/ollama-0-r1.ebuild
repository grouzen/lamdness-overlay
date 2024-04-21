EAPI=8

inherit acct-user

DESCRIPTION="user for ollama service"
ACCT_USER_ID=500
ACCT_USER_HOME=/usr/share/ollama
ACCT_USER_GROUPS=( ollama video )
ACCT_USER_SHELL=/bin/false

acct-user_add_deps
