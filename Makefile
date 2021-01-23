objects = prefix.blackbox-exporter prefix.mongodb-exporter prefix.prometheus
build.objects := $(subst prefix,build,$(objects))
push.objects := $(subst prefix,push,$(objects))
docker-host-ip := $$(yc compute instance list | awk '/docker-host/ {print $$10}')
docker-host-envs := eval $$(docker-machine env docker-host-00)

user_name = tomorrowcanw8

help: ## -- Show this help
	@grep -E '^[a-zA-Z\._-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: up.infra build.all ## -- Run project via docker-compose
	@$(docker-host-envs) && docker-compose -f docker/docker-compose.yml --env-file docker/.env up -d

down: ## -- Down project via docker-compose
	@$(docker-host-envs) && docker-compose -f docker/docker-compose.yml --env-file docker/.env down

clean: down.infra ## -- Remove entry project
	@-rm $(build.objects)

up.infra: ## -- Create docker-machine in Yandex Cloud
	@cd docker/docker-monolith/infra/ansible && ansible-playbook playbooks/site.yml \
	&& docker-machine create \
	--driver generic \
	--generic-ip-address=$(docker-host-ip) \
	--generic-ssh-user ubuntu \
	--generic-ssh-key ~/.ssh/appuser \
	docker-host-00 \
	&& cd - \
	&& touch up.infra

down.infra: ## -- Down docker-machine in Yandex Cloud
	@-cd docker/docker-monolith/infra/terraform && terraform destroy -auto-approve ; docker-machine rm docker-host-00 -y \
	; cd - \
	&& rm up.infra

push.all: $(push.objects) ## -- Push all images from project to registry

push.blackbox-exporter: build.blackbox-exporter ## -- Push blackbox exporter image to registry
	@$(docker-host-envs) && docker push $(user_name)/blackbox-exporter

push.mongodb-exporter: build.mongodb-exporter ## -- Push mongodb-exporter image to registry
	@$(docker-host-envs) && docker push $(user_name)/mongodb-exporter

push.prometheus: build.prometheus ## -- Push prometheus image to registry
	$(docker-host-envs) && docker push $(user_name)/prometheus

build.all: $(build.objects) ## -- Build all images from project to registry

build.blackbox-exporter: ## -- Build blackbox exporter
	@$(docker-host-envs) && docker build -t $(user_name)/blackbox-exporter monitoring/blackbox-exporter \
	&& touch build.blackbox-exporter

build.mongodb-exporter: ## -- Build mongodb-exporter
	@$(docker-host-envs) && docker build -t $(user_name)/mongodb-exporter monitoring/mongodb-exporter \
	&& touch build.mongodb-exporter

build.prometheus: ## -- Build prometheus-exporter
	@$(docker-host-envs) && docker build -t $(user_name)/prometheus monitoring/prometheus \
	&& touch build.prometheus
