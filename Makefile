RELEASE_TAG := v$(shell date +%Y%m%d-%H%M%S-%3N)

build:
	docker build -t galexrt/gameserver-win:latest .

release:
	git tag $(RELEASE_TAG)
	git push origin $(RELEASE_TAG)

release-and-build: build
	git tag $(RELEASE_TAG)
	docker tag galexrt/gameserver-win:latest galexrt/gameserver-win:$(RELEASE_TAG)
	git push origin $(RELEASE_TAG)
	docker push galexrt/gameserver-win:$(RELEASE_TAG)
	docker push galexrt/gameserver-win:latest
