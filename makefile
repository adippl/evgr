manifest:
	repoman --digest=y -d full

localPushCopy:
	cp ./* /var/db/repos/evgr/

find:
	find -name '*ebuild'

p:
	git push origin master
	-git push git.acmelab.top master
	git push git-sync master
