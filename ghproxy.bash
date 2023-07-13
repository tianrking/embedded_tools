#!/bin/bash

# 接收原始 GitHub URL
original_url=$1

# 检查 URL 是否来自 "raw.githubusercontent.com"
if [[ $original_url == https://raw.githubusercontent.com/* ]]
then
  new_url=${original_url/https:\/\/raw.githubusercontent.com/https:\/\/ghproxy.com\/https:\/\/raw.githubusercontent.com}
else
  new_url=${original_url/https:\/\/github.com/https:\/\/ghproxy.com\/https:\/\/github.com}
fi

# 判断是 git clone 还是 wget 操作
# 如果 URL 结尾为 .git 或者 URL 中包含 github.com/{user}/{repo}，则执行 git clone，否则执行 wget
if [[ $original_url == *.git ]] || [[ $original_url =~ https:\/\/github.com\/[^/]+\/[^/]+$ ]]
then
  # 使用新 URL 进行 git clone
  git clone $new_url
else
  # 使用新 URL 进行 wget
  wget $new_url
fi
