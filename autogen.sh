set -e
srcdir="$(dirname $0)"
cd "$srcdir"
libtoolize
which autoreconf >/dev/null || \
  (echo "configuration failed, please install autoconf first" && exit 1)
autoreconf --install --force --warnings=all