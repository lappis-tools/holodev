test:
	$(foreach test,$(wildcard tests/*_test.sh), sh $(test))

test-vagrant:
	vagrant up
	@for machine in $(shell vagrant status | awk '$$2 == "running" {print $$1}'); do\
		echo ""\
		echo "+++ $$machine +++"\
		echo ""\
		vagrant ssh $$machine -- 'cd /vagrant && make test'\
	done
