#!/bin/bash -eu

CMD_NAME="$(basename "$0")"
if [[ "$#" -ne 1 ]]; then
  echo "Usage: ${CMD_NAME} project-name" >&2
  exit 1
fi

PROJECT_NAME="$1"
PROJECT_DIR="${HOME}/vst-dev/${PROJECT_NAME}"

if [[ ! -d "${PROJECT_DIR}" ]]; then
  echo "${PROJECT_NAME} not found" >&2
  exit 1
fi

tmux rename-window "${PROJECT_NAME}"
tmux send-keys -t 0 "cd ${PROJECT_DIR}" C-m
tmux send-keys -t 0 "vi -O Source/*Editor.{h,cpp}" C-m
