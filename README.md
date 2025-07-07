<p align="center">
  <a href="https://garoa.app">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="./assets/logo-light.png">
      <source media="(prefers-color-scheme: light)" srcset="./assets/logo-dark.png">
      <img alt="Garoa" src="./assets/logo-light.png" height="84">
    </picture>
  </a>
  <h4 align="center"><code>@garoa-app/releases</code></h4>
  <p align="center">Stable and beta release channels for Garoa</p>
</p>

> [!WARNING]  
> Garoa is still under active development, with a major release scheduled for later in 2025. All versions prior to `1.0.0` are considered development builds and may introduce breaking changes without prior notice.
>
> If you found a bug or would like to provide feedback, please reach out to <a href="mailto:hello@garoa.app">hello@garoa.app</a>

## About

This repository is used for distributing prebuilt bundles and related packaging for the stable and beta release channels of Garoa in all major platforms. It **does not** contain the application's source code.

- **Stable channel**: Recommended for most users. This channel receives new features, improvements and fixes after they have been thoroughly tested.
- **Beta channel**: Intended for early adopters and contributors who want to preview and provide feedback before they reach the stable release. Expect more frequent updates (and bugs).

Each release channel is isolated, so both versions can be installed side by side on the same system.

## Installation

### macOS

The [releases page](https://github.com/garoa-app/releases/releases) contains Application Bundles and DMG installers (Recommended) for both stable and beta release channels. Make sure to select the correct CPU architecture: Apple Silicon (ARM - aarch64) or Intel (x64 - amd64). Future updates can be installed with the built-in updater.

### Windows

The [releases page](https://github.com/garoa-app/releases/releases) contains setup executables for both stable and beta release channels. Future updates can be installed with the built-in updater.

### Linux

#### Debian, Ubuntu, Raspberry Pi OS and derivatives (APT)

Packages are available through the official APT repository for both stable and beta release channels. You can install with:

```bash
(type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)) \
  && sudo mkdir -p -m 755 /etc/apt/keyrings \
  && curl -fsSL https://get.garoa.app/garoa-archive-keyring.gpg | sudo tee /etc/apt/keyrings/garoa-archive-keyring.gpg > /dev/null \
  && sudo chmod go+r /etc/apt/keyrings/garoa-archive-keyring.gpg \
  && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/garoa-archive-keyring.gpg] https://get.garoa.app/stable/apt stable main" | sudo tee /etc/apt/sources.list.d/garoa.list > /dev/null \
  && sudo apt update \
  && sudo apt install garoa -y
```

And upgrade with:

```
sudo apt update
sudo apt install garoa
```

<details>
  <summary>Beta channel</summary>

  Install:

  ```bash
  (type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && curl -fsSL https://get.garoa.app/garoa-archive-keyring.gpg | sudo tee /etc/apt/keyrings/garoa-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/garoa-archive-keyring.gpg \
    && sudo mkdir -p -m 755 /etc/apt/sources.list.d \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/garoa-archive-keyring.gpg] https://get.garoa.app/beta/apt beta main" | sudo tee /etc/apt/sources.list.d/garoa-beta.list > /dev/null \
    && sudo apt update \
    && sudo apt install garoa-beta -y
  ```
  
  Upgrade:
  
  ```
  sudo apt update
  sudo apt install garoa-beta
  ```

</details>

#### Fedora, CentOS, RHEL and derivatives (DNF4 & DNF5)

Packages are available through the official RPM repository for both stable and beta release channels. You can install with:

DNF5:
```
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://get.garoa.app/stable/rpm/garoa.repo
sudo dnf install garoa --repo garoa
```

DNF4:
```
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://get.garoa.app/stable/rpm/garoa.repo
sudo dnf install garoa --repo garoa
```

And upgrade with:
```
sudo dnf upgrade garoa
```

<details>
  <summary>Beta channel</summary>

  Install:

  DNF5:
  ```
  sudo dnf install dnf5-plugins
  sudo dnf config-manager addrepo --from-repofile=https://get.garoa.app/beta/rpm/garoa-beta.repo
  sudo dnf install garoa-beta --repo garoa-beta
  ```
  
  DNF4:
  ```
  sudo dnf install 'dnf-command(config-manager)'
  sudo dnf config-manager --add-repo https://get.garoa.app/beta/rpm/garoa-beta.repo
  sudo dnf install garoa-beta --repo garoa-beta
  ```

  Upgrade:

  ```
  sudo dnf upgrade garoa-beta
  ```

</details>

#### Arch Linux

If you're on Arch Linux (btw) you can use your preferred AUR helper:

```
yay -S garoa
# or
paru -S garoa
```

<details>
  <summary>Beta channel</summary>

  ```
  yay -S garoa-beta
  # or
  paru -S garoa-beta
  ```

</details>

#### Other distributions

The [releases page](https://github.com/garoa-app/releases/releases) contains prebuilt bundles for `.deb`, `.rpm` and `.AppImage`. If your Linux distro does not have official support yet, check for community-maintained repositories.
