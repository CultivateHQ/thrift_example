#!/usr/bin/env sh

SER=`elixir ./ruby_bin_serialise.exs "$@"`

echo $SER | tr -d '\n' | pbcopy

echo $SER
