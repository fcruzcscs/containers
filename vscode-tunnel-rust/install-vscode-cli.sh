#!/bin/sh

set -eu

case "$(dpkg --print-architecture)" in
    amd64)
        vscode_cli_os="cli-linux-x64"
        ;;
    arm64)
        vscode_cli_os="cli-linux-arm64"
        ;;
    armhf)
        vscode_cli_os="cli-linux-armhf"
        ;;
    *)
        echo "Unsupported architecture: $(dpkg --print-architecture)" >&2
        exit 1
        ;;
esac

download_url="https://update.code.visualstudio.com/latest/${vscode_cli_os}/stable"
temporary_directory="$(mktemp -d)"
trap 'rm -rf "$temporary_directory"' EXIT

curl -fsSL "$download_url" -o "$temporary_directory/vscode-cli.tar.gz"
tar -xzf "$temporary_directory/vscode-cli.tar.gz" -C "$temporary_directory"
install -m 0755 "$temporary_directory/code" /usr/local/bin/code
