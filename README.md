# k8s_docker

## How to use

I run k8s in minikube for testing, so just copy the auto.sh script to minikub and run it.

```(bash)
scp -i $(minikube ssh-key) <local-path> docker@$(minikube ip):<remote-path>
```

Notices that the private key for accessing your minikube machine is located at ~/.minikube/machines/*/id_rsa

Maybe when you run this script you get the error "/bin/bash^M: bad interpreter: No such file or directory", then try to run this:

```(bash)
sed -i -e 's/\r$//' auto.sh
```

This should work.
Then run the script to pull images from aliyun and run `minikube start`.

## Customs

You can replace the version of k8s and the registry address of the k8s images of your own.