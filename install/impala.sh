if command -v cargo &> /dev/null; then
  cd /tmp
  git clone https://github.com/pythops/impala
  cd impala
  cargo build --release
  sudo install target/release/impala /usr/local/bin/impala
  rm -rf impala
  cd -
fi