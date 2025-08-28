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

### 2. Uploading a file/directory
To upload a file from your local env, run:
```terminal
to_shirokane $local_filename $remote_path
```

and for a directory, run:
```terminal
to_shirokane -r $local_dirname $remote_path
```

### 3. Downloading a file.directory
To download a file from the remote env, the downloaded file will be stored in `shiorokane_io/download/$local_dirname` when you run the following:
```terminal
from_shirokane $remote_filename $local_dirname
```
Alternatively, you can download a file directly in `shiorokane_io/download` with:
```terminal
from_shirokane $remote_filename .
```
