#!/bin/bash

export CC=/usr/bin/clang-19
export CXX=/usr/bin/clang++-19
export PATH=$HOME/.local/bin:/usr/local/bin/:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD=/usr/bin/ld.lld
export LDFLAGS=-fuse-ld=/usr/bin/ld.lld
