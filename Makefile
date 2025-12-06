.PHONY: shell

shell:
	@docker run -it --rm \
		--network=host \
		-v ${PWD}:/workspace \
		-v ${PWD}/kubeconfig-docker:/root/.kube/config:ro \
		-v nix-store:/nix \
		-w /workspace \
		nixos/nix \
		nix-shell