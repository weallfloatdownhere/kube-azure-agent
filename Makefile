TAGS=1.0.0
DOCKERIMAGE=kube-azure-agent

DOCKUSERNAME=${DOCKERUSERNAME}
DOCKPASSWD=${DOCKERPASSWORD}
IMAGE_NAME=$(DOCKUSERNAME)/$(DOCKERIMAGE)

build:
	DOCKER_BUILDKIT=1 docker build -t az-agent-trial .

deploy:
	docker login --username="$(DOCKUSERNAME)" --password="$(DOCKPASSWD)"
	DOCKER_BUILDKIT=1 docker build -t $(IMAGE_NAME):$(TAGS) .
	docker push $(IMAGE_NAME):$(TAGS)
	docker tag $(IMAGE_NAME):$(TAGS) $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):latest
