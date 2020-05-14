# Cephfs

- `kubectl create namespace ceph-csi-cephfs`
- `helm install -f values.yaml --namespace "ceph-csi-cephfs" "ceph-csi-cephfs" ceph-csi/ceph-csi-cephfs --version 2.1.0`
- `kubectl apply -f secrets.yaml`
- `kubectl apply -f storageclass.yaml`

## Secret

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: csi-cephfs-secret
  namespace: ceph-csi-cephfs
stringData:
  # Required for statically provisioned volumes
  userID: <plaintext ID>
  userKey: <Ceph auth key corresponding to ID above>

  # Required for dynamically provisioned volumes
  adminID: <plaintext ID>
  adminKey: <Ceph auth key corresponding to ID above>
```

## Reclaim pv

edit delete `spec.claimRef`

```yaml
---

kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: dhanvi-test-pvc
spec:
  accessModes: 
    - ReadWriteOnce # adjust
  resources:
    requests:
      storage: 16Gi # adjust
  volumeName: "pvc-eae6acda-59c7-11e9-ab12-06151ee9837e" # adjust
  storageClassName: cephfs-retain # adjust
```