# Based on a layer where checkers and their toolchains are installed.
FROM zjpzjp/os-checker:local

SHELL ["/bin/bash", "-lc"]

# Check if checkers are properly installed
RUN cargo +nightly-2021-10-21 rudra --help && \
  cargo +nightly-2025-01-10 mirai --help && \
  cargo +nightly-2025-02-01 lockbud --help && \
  cargo +nightly-2024-10-12 rapx --help && \
  cargo audit --version && \
  cargo outdated --version && \
  cargo geiger --version && \
  cargo semver-checks --version

# Install os-checker
RUN cargo install --git https://github.com/os-checker/plugin-github-api.git
RUN cargo install --git https://github.com/os-checker/plugin-cargo.git
# generate webui/dist
RUN git clone https://github.com/os-checker/os-checker.github.io.git webui && \
  cd webui/os-checks && npm install && npm run generate

# don't clear cache.redb⋅
RUN git clone https://github.com/os-checker/os-checker.git && \
  cd os-checker && export CARGO_TARGET_DIR=$PWD/target && \
  cargo install --path . os-checker --locked && \
  cargo install --path . os-checker --locked --example batch && \
  cargo install --path os-checker-database --locked --no-default-features && \
  cd .. && rm os-checker -r

ENTRYPOINT ["bash", "-lc"]
# CMD ["./run.sh"]
