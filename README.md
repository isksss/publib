# publib
いろいろ使えそうなlib集

## raw

```
https://raw.githubusercontent.com/isksss/publib/main/{dir}/{file}
```

## usage

### shell

### 複数ファイルを読み込む場合
```sh
# load publib manager
. <(curl -fsSL https://raw.githubusercontent.com/isksss/publib/main/sh/manager.sh)

# load some file
load_publib log.sh
load_publib paper.sh

# download paper project.
log_info "download papermc"
paper-download "paper" "1.16.5"
```

### そのまま読み込む場合
```sh
# load
. <(curl -fsSL https://raw.githubusercontent.com/isksss/publib/main/sh/paper.sh)
# download paper project.
paper-download "paper" "1.16.5"
```