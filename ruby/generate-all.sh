#/usr/bin/env sh

# Generate all the implementations from the definitions in the thrift directory.
# You're going to need Thrift installed. https://thrift-tutorial.readthedocs.io/en/latest/installation.html
# and the thrift binary in your path.

 ls thrift/*.thrift | xargs -n 1 thrift -o lib -gen rb
