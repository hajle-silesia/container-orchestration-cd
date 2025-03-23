## About

Repository for container orchestration CD.

## Architecture

### CD

[Argo CD](https://argo-cd.readthedocs.io/en/stable/) is used as a tool for container orchestration CD.

### Config upgrade

[Reloader](https://github.com/stakater/Reloader) is used as a tool for configs upgrade in related workloads.
See configuration details [here](https://github.com/stakater/Reloader?tab=readme-ov-file#how-to-use-reloader).

Testing now: https://helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments as Reloader is not reliable.

### Config replication

[Reflector](https://github.com/emberstack/kubernetes-reflector) is used as a tool for configs (ConfigMaps, Secrets, Certificates, etc.) replication across namespaces. For security and transparency, it's recommended to avoid automatically enabled replication. Instead, replication should be a mutual agreement of:
- source namespace owners adding destination namespace to the annotated list of namespaces with allowed reflection
- destination namespace owners adding source namespace and object name it aims to reflect to the annotations

That way, configs replication occur only where needed instead of cluster-wide manner.
See configuration details [here](https://github.com/emberstack/kubernetes-reflector?tab=readme-ov-file#usage).

### Storage

[Longhorn](https://longhorn.io/) is used as a tool for persistent storage. In case of uninstalling Longhorn from the cluster, deleting all workloads (PersistentVolume, PersistentVolumeClaim, StorageClass, Deployment, StatefulSet, DaemonSet, etc.) using Longhorn volumes is recommended to prevent damage to the cluster.

OCI Object Storage is used as a storage backup solution for the cluster. Detailed setup can be found [here](https://docs.oracle.com/en/learn/object-storage-longhorn-backups/index.html#task-4-create-a-kubernetes-secret).
