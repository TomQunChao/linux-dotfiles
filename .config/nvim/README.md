# 如何安装一个可以安装到离线机器上的NVIM

## 本配置的文件结构

```sh
├── coc-settings.json # LSP配置&COC配置
├── format # 格式化文件配置
│   └── c
├── init.lua # neovim默认配置
└── lua
    ├── core # 核心配置
    │   ├── autocmds.lua # 自动命令(TODO)
    │   ├── init.lua # 相关选项和配置(TODO)
    │   └── util.lua # 工具函数
    └── plugins
        ├── coc.lua # COC快捷键配置
        ├── comment.lua # Comment插件配置
        ├── init.lua # 插件列表和插件配置
        ├── vim-instant-markdown.lua # markdown语言支持
        └── which-key.lua # 快捷键配置和which-key插件配置
```

## 如何安装

本配置支持neovim0.8+

### 安装neovim

在linux上，可以利用包管理器安装。Windows上也可以利用包管理器诸如Msys2安装

在Windows和离线环境上，可以访问[官方release page](https://github.com/neovim/neovim/releases/tag/stable)，下载appimage(linux),或msi(windows)，之后安装

- Linux上AppImage安装：

创建文件夹

```sh
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/nvim/binarys
```

然后拷贝并创建链接

```sh
cp nvim.appimage ~/.local/share/nvim/binarys/
chmod +x ~/.local/share/nvim/binarys/nvim.appimage
ln -s ~/.local/share/nvim/binarys/nvim.appimage ~/.local/bin/nvim
```

### 创建Conda环境

conda提供了python支持和其它运行依赖支持

首先下载[Miniconda3](https://docs.conda.io/en/latest/miniconda.html)

按照默认配置安装之后，创建环境并安装对应包

```sh
conda install conda-pack
conda create -n nvim python=3.9 -y
conda activate nvim
# 安装相关依赖包，可以根据自己的需要去除某些语言包
conda install clangdev clang gcc gxx cmake openjdk lua ruby go cython git nodejs==16.17.1 jupyter jedi-language-server jupyter ueberzug Pillow cairosvg pnglatex plotly kaleido neovim pynvim pip -c conda-forge -y
conda deactivate
conda pack -n nvim
mkdir -p ~/.local/share/nvim/binarys/env
tar -xf nvim.tar.gz -C ~/.local/share/nvim/binarys/env
```

之后需要将路径添加到`.bashrc`

```sh
export PATH=$PATH:~/.local/share/nvim/binarys/env/bin
export LD_LIBRARY=~/.local/share/nvim/binarys/env/lib:$LD_LIBRARY
```

### 安装Rust(可选)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

之后可以安装[rust-analyzer](https://github.com/rust-lang/rust-analyzer/releases)，下载之后解压，放在`~/.local/share/rust-analyzer`之后`ln -s ~/.local/share/rust-analyzer/rust-analyzer ~/.local/bin/rust-analyzer`

安装Rust源码

```sh
rustup component add rust-src
```

### 安装Go语言(可选)

上面已经使用conda安装了go语言，这里直接配置[GoProxy](https://goproxy.io/zh/)

```sh
export GOPROXY=https://proxy.golang.com.cn,direct
```

## 安装插件

```sh
git clone https://github.com/TomQunChao/linux-dotfiles.git ~/Downloads/ && cp ~/Downloads/linux-dotfiles/.config/nvim ~/.config/nvim -r && rm ~/Downloads/linux-dotfiles ~/.config/nvim/.git -rf
```

打开Neovim，lazy会直接安装相关插件

### 安装fzf

[fzf](https://github.com/junegunn/fzf)是模糊搜索神器，这里主要用它模糊搜索文档符号

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### 安装其它依赖

- [fd](https://github.com/sharkdp/fd/releases/)，类似find命令，下载解压之后放入`~/.local/bin/`
- [rg](https://github.com/BurntSushi/ripgrep/releases/)，类似grep命令，下载之后放入`~/.local/bin/`

### [TODO]插件介绍

目前在`lua/plugins/init.lua`中有注释

### 安装[coc.nvim](https://github.com/neoclide/coc.nvim)插件

打开nvim之后，执行如下命令，可以根据自己的需要选择

```sh
:CocInstall coc-rust-analyzer coc-clangd coc-css coc-cmake coc-eslint coc-go coc-html coc-java coc-texlab coc-toml coc-tsserver coc-toml coc-yaml coc-xml 
:CocInstall coc-vetur coc-python coc-docker coc-lua coc-jedi coc-json coc-sql coc-vimlsp coc-sh coc-pairs coc-git
```

实际上只有rust,c,python的language server，需要其它的可以去对应网站查看安装指南

## 导出环境和转移环境

```sh
cd ~
tar -zcf nvim-all.tar.gz .local/share/nvim .config/nvim .config/coc .cache/nvim .fzf .local/bin/rg .local/bin/fd .cargo .rustup .fzf.bash
```

之后在其他机器上

```sh
tar -xf nvim-all.tar.gz -C ~
echo "export PATH=$PATH:~/.local/share/nvim/binarys/env/bin" >> ~/.bashrc
echo "export LD_LIBRARY=~/.local/share/nvim/binarys/env/lib:$LD_LIBRARY" >> ~/.bashrc
echo '. "$HOME/.cargo/env"' >> ~/.bashrc
echo '[ -f ~/.fzf.bash ] && source ~/.fzf.bash' >> ~/.bashrc
echo 'export PATH=~/.local/bin/:$PATH' >> ~/.bashrc
```

## 学习资料

- [Neovim LuaGuide](https://neovim.io/doc/user/lua-guide.html#lua-guide)
- [Vim Online Turtoal](https://www.openvim.com/tutorial.html)

## FAQ

- 安装之后pip不能用：可以使用[get-pip](https://bootstrap.pypa.io/get-pip.py)重新安装pip