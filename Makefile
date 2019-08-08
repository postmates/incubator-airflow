# ----------------
#    Docker
# ----------------
IMAGE ?= quay.io/postmates/airflow
TAG ?=  dharam_test_20190808 #  1.10.3d

prod-build:
	docker build -t $(IMAGE):$(TAG) .

prod-push:
	docker push $(IMAGE):$(TAG)

test-build:
	docker build -t $(IMAGE):$(TAG)-test-image .

test-push:
    docker push $(IMAGE):$(TAG)-test-image

prod-upgrade: prod-build prod-push

test-image: test-build test-push

pull:
	docker pull $(IMAGE):$(TAG)

clean-image:
	docker rmi $(IMAGE):$(TAG) -f
