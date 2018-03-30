#/usr/bin/env sh

# Generate all the implementations from the definitions in the thrift directory.
# You're going to need Thrift installed. https://thrift-tutorial.readthedocs.io/en/latest/installation.html
# and the thrift binary in your path.

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

THRIFT_DIR="$BASE_DIR/thrift"
OUTPUT_DIR="$BASE_DIR/python"



ls "$THRIFT_DIR/" | grep '\.thrift$' | xargs -I % thrift -o ${OUTPUT_DIR} -gen py "$THRIFT_DIR/%"
