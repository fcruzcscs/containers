# VS Code Tunnel with Rust

This container provides an Ubuntu 24.04 environment for remote Rust development through a VS Code tunnel. It includes the standalone VS Code CLI, a minimal stable Rust toolchain, Git, common Rust build dependencies, OpenSSL development headers, and SSH client support.

## Build

From the repository root:

```sh
podman build -f vscode-tunnel-rust/Containerfile -t vscode-tunnel-rust vscode-tunnel-rust
```

## Run a tunnel

Start the container interactively and authenticate the VS Code CLI from inside it:

```sh
podman run --rm -it vscode-tunnel-rust bash
code tunnel --accept-server-license-terms
```

Follow the prompts to sign in and name the tunnel. For a persistent tunnel, omit `--rm` and assign a container name, or add a suitable volume for credentials according to the VS Code CLI setup you use.


## Included tools

- Ubuntu 24.04
- Standalone VS Code CLI (`code`)
- Rust stable via rustup, using the minimal profile
- Cargo and rustc
- Git, SSH client, and build tooling
- `pkg-config` and `libssl-dev`
