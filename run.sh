set -ex
git config --global http.proxy http://172.17.0.1:5929

# force downloading repos to run check
export FORCE_REPO_CHECK=false
# force running checks after downloading repos
export FORCE_RUN_CHECK=false

os-checker db --start cache.redb
os-checker run --config repo.json --emit batch/out.json --db cache.redb --no-layout-error
os-checker db --done cache.redb
