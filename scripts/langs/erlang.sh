#!/usr/bin/env bash

# Erlang and Elixir
brew install erlang
brew install elixir

# Install Phoenix
mix archive.install --force hex phx_new
