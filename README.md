# Server Notes

## Ceph

### 500 Error in Dashboard with selfsinged cert

`ceph dashboard set-grafana-api-ssl-verify False`

### Ceph auth for manila

```bash
read -d '' MON_CAPS << EOF
allow r,
allow command "auth del",
allow command "auth caps",
allow command "auth get",
allow command "auth get-or-create"
EOF

ceph auth get-or-create client.manila -o manila.keyring \
mds 'allow *' \
osd 'allow rw' \
mon "$MON_CAPS"
```

### Manila share type

<https://docs.openstack.org/manila/latest/admin/cephfs_driver.html#restrictions-with-cephfs-native-share-backend>

```bash
manila type-create cephfsnativetype false
manila type-key cephfsnativetype set vendor_name=Ceph storage_protocol=CEPHFS
```

## Kubernetes

### Install

```bash
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
```

```bash
echo br_netfilter > /etc/modules-load.d/k8s.conf
modprobe br_netfilter
```

```bash
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

```bash
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```

```bash
kubectl apply -f https://docs.projectcalico.org/v3.11/manifests/calico.yaml
```

```bash
kubectl taint nodes --all node-role.kubernetes.io/master-
```

### node

```bash
kubeadm join 10.10.2.58:6443 --token tmix1q.v2nl4rjy0ejl09bl \
    --discovery-token-ca-cert-hash sha256:b3f0eddfad4410c437f1a572c759903fb33bfa2c105c543b051b02ef64dd06cb
```

### sono

```bash
VERSION=0.16.1 OS=linux && \
    curl -L "https://github.com/vmware-tanzu/sonobuoy/releases/download/v${VERSION}/sonobuoy_${VERSION}_${OS}_amd64.tar.gz" --output $HOME/bin/sonobuoy.tar.gz && \
    tar -xzf $HOME/bin/sonobuoy.tar.gz -C $HOME/bin && \
    chmod +x $HOME/bin/sonobuoy && \
    rm $HOME/bin/sonobuoy.tar.gz
```