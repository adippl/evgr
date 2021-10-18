manifest:
	repoman --digest=y -d full

localPushCopy:
	cp ./* /var/db/repos/evgr/

find:
	find -name '*ebuild'
