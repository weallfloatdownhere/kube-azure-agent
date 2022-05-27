TAGS=1.0.0
DOCKERIMAGE=kube-azure-agent

DOCKUSERNAME=${DOCKERUSERNAME}
DOCKPASSWD=${DOCKERPASSWORD}
IMAGE_NAME=$(DOCKUSERNAME)/$(DOCKERIMAGE):$(TAGS)

build:
	DOCKER_BUILDKIT=1 docker build -t az-agent-trial .

deploy:
	docker login --username="$(DOCKUSERNAME)" --password="$(DOCKPASSWD)"
	DOCKER_BUILDKIT=1 docker build -t $(IMAGE_NAME) .
	docker push $(IMAGE_NAME)
