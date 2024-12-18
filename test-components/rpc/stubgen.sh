#!/usr/bin/env sh
set -uox pipefail

rm -rf counters-stub
wasm-rpc-stubgen generate --source-wit-root counters/wit --dest-crate-root counters-stub --wasm-rpc-path-override /Users/vigoo/projects/ziverge/wasm-rpc/wasm-rpc
rm -rf caller/wit/deps
mkdir -pv caller/wit/deps
cp -rv counters-stub/wit/deps/* caller/wit/deps
mkdir -pv caller/wit/deps/counters-stub
cp counters-stub/wit/_stub.wit caller/wit/deps/counters-stub/stub.wit

rm -rf ephemeral-stub
wasm-rpc-stubgen generate --source-wit-root ephemeral/wit --dest-crate-root ephemeral-stub --wasm-rpc-path-override /Users/vigoo/projects/ziverge/wasm-rpc/wasm-rpc
cp -rv ephemeral-stub/wit/deps/* caller/wit/deps
mkdir -pv caller/wit/deps/ephemeral-stub
cp ephemeral-stub/wit/_stub.wit caller/wit/deps/ephemeral-stub/stub.wit
