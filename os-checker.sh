set -xe

export INSTALL=$PWD/install

mkdir $INSTALL

# Install Rudra
git clone https://github.com/os-checker/Rudra.git $INSTALL/rudra
cd $INSTALL/rudra
git switch master
cargo install --path . --locked
cargo rudra --help

# Install Mirai
git clone https://github.com/os-checker/MIRAI.git $INSTALL/mirai
cd $INSTALL/mirai
git switch main
cargo install --path checker --no-default-features -F z3,z3-sys --locked
cargo mirai --help

# Install Rap

git clone https://github.com/os-checker/RAP.git $INSTALL/rap
cd $INSTALL/rap
git switch main
cd rap
cargo install --path .
cargo rap --help

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git $INSTALL/lockbud
cd $INSTALL/lockbud
git switch all
cargo install --path . --locked
cargo lockbud --help

# Set up default toolchain
rustup default nightly-2025-04-30

#Install os-checker
cargo install --git https://github.com/os-checker/os-checker.git os-checker
