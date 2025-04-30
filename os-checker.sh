set -xe

export INSTALL=$PWD/install

mkdir $INSTALL
pushd $INSTALL

# Install Rudra
git clone https://github.com/os-checker/Rudra.git $INSTALL/rudra
pushd $INSTALL/rudra
cargo install --path . --locked
cargo rudra --help
popd

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git $INSTALL/mirai
pushd $INSTALL/mirai
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help
popd

# Install Rap

git clone https://github.com/os-checker/RAP.git $INSTALL/rap
pushd $INSTALL/rap
cd rap
cargo install --path .
cargo rap --help
popd

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git $INSTALL/lockbud
pushd $INSTALL/lockbud
git switch all
cargo install --path . --locked
cargo lockbud --help
popd

popd
# Set up default toolchain
rustup default nightly-2025-04-30

#Install os-checker
cargo install --git https://github.com/os-checker/os-checker.git os-checker
