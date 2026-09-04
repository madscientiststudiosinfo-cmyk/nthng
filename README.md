# Nthgn: Private & Secure Messaging

**Nthgn** is the premier, privacy-focused open-source messaging platform for total anonymity.

## Quick Start
Get Nthgn running on your system with ease:

### Linux
```bash
curl -sSL https://raw.githubusercontent.com/madscientiststudiosinfo-cmyk/nthng/main/install.sh | bash
```

### macOS & Windows
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Clone the repository: `git clone https://github.com/madscientiststudiosinfo-cmyk/nthng.git`
3. Navigate to folder and build: `docker build -t nthgn-node .`
4. Run server:
   - Private: `docker run -d -p 127.0.0.1:5000:5000 nthgn-node`
   - Public: `docker run -d -p 0.0.0.0:5000:5000 nthgn-node`

## Server Management
Once running, manage your node:
- **Start Private Server:** `./scripts/install_server.sh private`
- **Start Public Server:** `./scripts/install_server.sh public`

## Downloads
Pre-compiled binaries for desktop:
- [Windows (.exe)](https://github.com/madscientiststudiosinfo-cmyk/nthng/releases/latest/download/nthgn.exe)
- [macOS (.dmg)](https://github.com/madscientiststudiosinfo-cmyk/nthng/releases/latest/download/nthgn.dmg)
- [Linux (.deb)](https://github.com/madscientiststudiosinfo-cmyk/nthng/releases/latest/download/nthgn.deb)

## License & Contributing
Licensed under MIT. See [CONTRIBUTING.md](CONTRIBUTING.md).
