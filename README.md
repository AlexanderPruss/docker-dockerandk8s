# docker-dockerandk8s

A docker image containing both docker and kubernetes. Used by the author to run k8s inside a Jenkins pipeline with the Jenkins-Kubernetes plugin.

# Tags

* `latest`, `1.6.4` - kubectl v1.6.4, docker v18

# Usage

This image extends a docker image and adds an executable `kubectl`. `kubectl` still needs to be configured, however. You'll need
to copy a `kubectl` config into the container and either move it to `~/.kube/config` or run `kubectl` with the `--kubeconfig` flag.

## Example - running in a scripted Jenkins pipeline

Assuming you're using the Jenkins k8s plugin, with your config file saved in Jenkins as a credential:

    //'dockerk8s' is defined at the start of the pipeline.
    container('dockerk8s') {
      withCredentials([file(credentialsId: 'kube-config', variable: 'k8sconfig')]) {
          sh "cp $env.{k8sconfig} ~/.kube/config"
          sh "kubectl get pods" //(or whatever command you want)
      }
    }

## Example - running locally

Assuming your configuration is in a file called `kubeconfig`:

In one terminal:
`docker pull alexpruss/dockerandkubectl:1.6.4`
`docker run -it alexpruss/dockerandkubectl:1.64`

In a second terminal:
`docker ps` (find the container id)
`docker cp kubeconfig $containerId:~/.kube/config`

In the first terminal again:
`kubectl get pods` (or whatever command you want)
