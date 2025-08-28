# shirokane_io
Directory for managing data input/output between your local environment and SHIROKANE HPC.

## Usage
### 1. Setting
Add the following lines to your `.zshrc`:

```bash
export SHIROKANE_ID=$your_user_id
[ -f "$parent_dirs/shirokane_io/io.sh" ] && source "$parent_dirs/shirokane_io/io.sh"
```

Make sure to replace `$your_user_id` with your actual SHIROKANE login ID,
and update `$parent_dirs` to the absolute or relative path leading to the `shirokane_io` directory.

### 2. Uploading Files or Directories
To upload a file to SHIROKANE:
```bash
to_shirokane $local_filename $remote_path
```

To upload a directory, add the `-r` option:
```bash
to_shirokane -r $local_dirname $remote_path
```

### 3. Downloading Files or Directories
To download a remote file or directory, and store it under `shirokane_io/download/`:
```bash
from_shirokane $remote_filename $local_dirname
```
This will create:
```bash
shirokane_io/download/$local_dirname
```
To download into the base `download/` directory with the original filename:
```bash
from_shirokane $remote_filename .
```
