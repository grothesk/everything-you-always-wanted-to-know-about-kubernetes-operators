CLUSTER_NAME := deeptalk
CLUSTER_CPUS := 6
CLUSTER_MEMORY :=8g
CLUSTER_DRIVER := kvm
CLUSTER_DISK_SIZE := 30g

OPERATOR_PROJECT := deep-ployment-operator
OPERATOR_DOMAIN := deepshore.de
OPERATOR_GROUP := deeptalk
OPERATOR_VERSION := v1alpha1
OPERATOR_KIND := DeepPloyment

init-operator-project:
	mkdir ${OPERATOR_PROJECT}
	cd ${OPERATOR_PROJECT} && operator-sdk init --domain ${OPERATOR_DOMAIN} --plugins ansible --group ${OPERATOR_GROUP} --version ${OPERATOR_VERSION} --kind ${OPERATOR_KIND} --generate-role

rm-operator-project:
	rm -rf ${OPERATOR_PROJECT}

create-or-restart-cluster:
	minikube start -p ${CLUSTER_NAME} --cpus=${CLUSTER_CPUS} --memory=${CLUSTER_MEMORY} --disk-size=${CLUSTER_DISK_SIZE} --driver=${CLUSTER_DRIVER}

stop-cluster:
	minikube stop -p ${CLUSTER_NAME}

delete-cluster:
	minikube delete -p ${CLUSTER_NAME}

install-olm:
	operator-sdk olm install

uninstall-olm:
	operator-sdk olm uninstall

install-operator-via-olm:
	kubectl apply -k deep-ployment-catalog/example

test-operator:
	cd deep-ployment-operator && hack/test.sh
