# Tools

- `kubectl get pv pvc-fb90d536-4f94-4a67-8e27-02e7a404a0f1 -o=yaml > music-backup.yaml`
- `kubectl patch pv pvc-fb90d536-4f94-4a67-8e27-02e7a404a0f1 -p '{"spec":{"claimRef": null}}'`