#!/bin/bash

KUBE_VERSION=v1.13.4
KUBE_PAUSE_VERSION=3.1
KUBE_ADDON_MANAGER_VERSION=v8.6
KUBE_DASHBOARD_VERSION=v1.10.1
ETCD_VERSION=3.2.24
COREDNS_VERSION=1.2.6
STORAGE_PROVISIONER_VERSION=v1.8.1

GCR_URL=k8s.gcr.io
ALIYUN_URL=registry.cn-shanghai.aliyuncs.com/k8s-gcr-io-akka

images=(kube-proxy:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-apiserver:${KUBE_VERSION}
kube-addon-manager:${KUBE_ADDON_MANAGER_VERSION}
kubernetes-dashboard-amd64:${KUBE_DASHBOARD_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${COREDNS_VERSION})

for imageName in ${images[@]} ; do
  docker pull $ALIYUN_URL/$imageName
  docker tag  $ALIYUN_URL/$imageName $GCR_URL/$imageName
  docker rmi $ALIYUN_URL/$imageName
done

# for storage-provisioner

storage_provisioner=storage-provisioner:${STORAGE_PROVISIONER_VERSION}
docker pull $ALIYUN_URL/$storage_provisioner
docker tag  $ALIYUN_URL/$storage_provisioner gcr.io/k8s-minikube/$storage_provisioner
docker rmi $ALIYUN_URL/$storage_provisioner  

docker images