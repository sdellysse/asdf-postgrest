get_os() {
  uname | tr '[:upper:]' '[:lower:]'
}

get_arch() {
  uname -m
}

get_download_filename() {
  local -r version=$ASDF_INSTALL_VERSION
  local -r os=$(get_os)
  local -r arch=$(get_arch)

  if [ "$os" = "linux" ] && [ "$arch" = "x86_64" ]; then
    echo "postgrest-v${version}-linux-static-x64.tar.xz"
    return
  fi

  echo "postgrest-v${version}-${os}-${arch}.tar.xz"
  return
}