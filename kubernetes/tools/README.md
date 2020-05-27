# Tools

- `kubectl get pv pvc-fb90d536-4f94-4a67-8e27-02e7a404a0f1 -o=yaml > music-backup.yaml`
- `kubectl patch pv pvc-fb90d536-4f94-4a67-8e27-02e7a404a0f1 -p '{"spec":{"claimRef": null}}'`

```bash
chown -R 1000:1000 *
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
```

```bash
apt update && apt install rsync ssh vim -y

ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
ssh-copy-id kkurz@192.168.178.28

rsync -aPv kkurz@192.168.178.28:/sharedfolders/movies/ /new/movies
rsync -aPv kkurz@192.168.178.28:/sharedfolders/tv/ /new/tv
rsync -aPv kkurz@192.168.178.28:/sharedfolders/anime/ /new/anime
```