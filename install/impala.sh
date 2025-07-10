if command -v cargo &> /dev/null && ! command -v impala &> /dev/null; then
  cd /tmp
  git clone https://github.com/pythops/impala
  cd impala
  cargo build --release --locked
  sudo mv target/release/impala /usr/local/bin/
  cd ..
  rm -rf impala
  cd -
fi