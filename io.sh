# io.sh

if [ -z "$SHIROKANE_IO_DIR" ]; then
  SHIROKANE_IO_DIR="$(cd "$(dirname "${(%):-%N}")" && pwd)"
fi

to_shirokane () {
    if [ "$#" -lt 2 ]; then
        echo "Usage: to_shirokane [scp_options] <local_path> <remote_path>"
        echo "Example: to_shirokane -r ./myfolder ~/remote_dir/"
        return 1
    fi

    if [ -z "$SHIROKANE_ID" ]; then
        echo "Error: SHIROKANE_ID is not set. Please export your SHIROKANE_ID first."
        return 1
    fi

    local host="slogin.hgc.jp"

    local remote_path="${@: -1}"
    local local_path="${@: -2:1}"
    local options=("${@:1:$(($#-2))}")

    scp "${options[@]}" "$local_path" "${SHIROKANE_ID}@${host}:${remote_path}"
}


from_shirokane () {
    if [ "$#" -lt 2 ]; then
        echo "Usage: from_shirokane [scp_options] <remote_path> <local_path>"
        echo "Example: from_shirokane -r ~/remote_dir local_folder"
        echo "local_folder will be created inside shirokane_io/download/ for safety"
        return 1
    fi

    if [ -z "$SHIROKANE_ID" ]; then
        echo "Error: SHIROKANE_ID is not set. Please export your SHIROKANE_ID first."
        return 1
    fi

    local host="slogin.hgc.jp"

    local remote_path="${@: -2:1}"
    local local_path="${SHIROKANE_IO_DIR}/download/${@: -1}"
    local options=("${@:1:$(($#-2))}")

    mkdir -p "$(dirname "$local_path")"

    scp "${options[@]}" "${SHIROKANE_ID}@${host}:${remote_path}" "$local_path"
}
