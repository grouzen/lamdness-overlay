EAPI=8

inherit acct-user

DESCRIPTION="user for ollana service"
ACCT_USER_ID=998
ACCT_USER_GROUPS=( ollana )
ACCT_USER_HOME=/var/lib/ollana
ACCT_USER_SHELL=/sbin/nologin

acct-user_add_deps
