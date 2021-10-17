manifest:
	repoman --digest=y -d full

localPushCopy:
	~/git/evgr/* /var/db/repos/evgr/

find:
	find -name '*ebuild'
