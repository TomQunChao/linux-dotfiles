# helix编辑器静态编译

## 安装依赖库
```sh
sudo apt install musl-tools
rustup component add rust-std-x86_64-unknown-linux-musl
```

## 编译

```sh
 RUSTFLAGS="-C target-feature=-crt-static -lm -lpthread" cargo install --path helix-term --locked --target x86_64-unknown-linux-musl
```

编译好的库位于`./target/x86_64-unknown-linux-musl/release/hx`中，拷贝到`.local/bin/`

```sh
cp ./target/x86_64-unknown-linux-musl/release/hx ~/.local/bin
cp themes ~/.local/helix -r
cp runtime ~/.local/helix -r
```