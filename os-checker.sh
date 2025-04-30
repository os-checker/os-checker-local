set -xe

export CARGO_TERM_COLOR=always
DEFAULT_TOOLCHAIN=nightly-2025-04-30

# $PWD=/ in the docker container
echo $PWD
INSTALL=install

mkdir $INSTALL
pushd $INSTALL
echo $PWD

# Install Rudra
git clone https://github.com/os-checker/Rudra.git rudra
pushd rudra
cargo install --path . --locked
cargo rudra --help
popd

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git mirai
pushd mirai
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help
popd

# Install Rap
git clone https://github.com/os-checker/RAPx.git rapx
pushd rapx
cd rapx
cargo install --path .
cargo rapx --help
popd

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git lockbud
pushd lockbud
git switch all
cargo install --path . --locked
cargo lockbud --help
popd

# Back to $PWD
popd
echo $PWD
# Clean all checker repos
rm $INSTALL -rf

# Set up default toolchain
rustup toolchain install $DEFAULT_TOOLCHAIN
rustup default $DEFAULT_TOOLCHAIN

#Install os-checker
cargo install --git https://github.com/os-checker/os-checker.git os-checker
os-checker --help
