#!/usr/bin/env just --justfile

flake := env_var_or_default('FLAKE_ROOT', justfile_directory())
scripts := flake / "scripts"
tools := flake / "tools"
runner := "runner"

default:
  @just --list

run VERB TASK *ARGS:
  {{ scripts / TASK / runner }} {{ VERB }} {{ ARGS }}

commit *ARGS:
  git add {{ flake }} && git -C {{ flake }} commit {{ ARGS }}
