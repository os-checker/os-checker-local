set -xe

export INSTALL=install

mkdir $INSTALL

# Install Lockbud
git clone https://github.com/os-checker/lockbud.git $INSTALL/lockbud
cd $INSTALL/lockbud
git switch all
cargo install --path . --locked
cargo lockbud --help
