salt_call:
	sudo salt-call state.highstate --local --file-root=./salt --pillar-root=./pillar
