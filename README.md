# kube-azure-agent
Containerized Azure Devops Self-Hosted pipeline agent.

---

## Usage with helm.

```bash
helm upgrade --reset-values --install --create-namespace --kubeconfig $(pwd)/kube_config_cluster.yml --namespace rkeqa-ns-az --values $(pwd)/values.yml azagents ./helm
```

---

## Values file (`values.yml`).

```yaml
replicaCount: 2

image:
  repository: silentreatmen7/kube-azure-agent
  pullPolicy: Always
  tag: latest
  pullSecret:
    create: True
    registry: ""
    username: ""
    password: ""
    email: devops@azure.io

pipelines:
  url: ""
  pat:
    value: ""
  pool: ""
  agent:
    name: "azagent"
    mountDocker: true
    workDir: "_work"

serviceAccount:
  create: true
  clusterAdmin: true
  name: azadmin

imagePullSecrets: 
- name: regcred
```

*Build only without parameters. (default name az-agents-trial)*

```bash
$ make build
```

*Build and push to remote registry.*

```bash
# Build and deploy to remote registry
$ export DOCKERUSERNAME=[USERNAME]
$ export DOCKERPASSWORD=[PASSWORD]
$ make deploy
```