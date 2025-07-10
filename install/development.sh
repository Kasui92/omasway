sudo apt install -y \
  build-essential pkg-config autoconf bison clang \
  libmysqlclient-dev libpq-dev postgresql-client postgresql-client-common

# Install Rust and Cargo
if ! command -v rustup &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
else

