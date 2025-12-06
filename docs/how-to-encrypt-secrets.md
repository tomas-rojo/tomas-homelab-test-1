```
kubeseal \
    --format=yaml \
    --controller-name=sealed-secrets \
    --controller-namespace=kube-system \
    < secret.yaml > sealed-secret.yaml
```

# Using Kubeseal to Encrypt Secrets

Kubeseal is a tool that encrypts Kubernetes secrets using a sealing key, allowing to safely commit encrypted secrets to Git.

## Encrypting Secrets

1. Create a secret YAML file:
```bash
kubeseal \
--format=yaml \
--controller-name=sealed-secrets \
--controller-namespace=kube-system \
< secret.yaml > sealed-secret.yaml
```

The controller will automatically decrypt it into a regular Secret.

## Decrypting Secrets

To view a sealed secret:
```bash
kubeseal \
--controller-name=sealed-secrets \
--controller-namespace=kube-system \
-f pg-secret.yaml --recovery-unseal
```

## Tips

- Sealed secrets are namespace-specific by default (use `--scope cluster-wide` to make them cluster-wide)
- Store sealed-secret.yaml in Git; delete plain secret.yaml
- Backup your sealing key for disaster recovery
- Rotate sealing keys periodically for security
- Use different sealing keys per environment (dev, staging, prod)