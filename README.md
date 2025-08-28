# shirokane_io
Directory for managing data input/output between your local environment and SHIROKANE HPC.

## Usage
Add the following lines to your `.zshrc`:

```bash
export SHIROKANE_ID=$your_user_id
[ -f "$parent_dirs/shirokane_io/io.sh" ] && source "$parent_dirs/shirokane_io/io.sh"
```

Make sure to replace `$your_user_id` with your actual SHIROKANE login ID,
and update `$parent_dirs` to the absolute or relative path leading to the `shirokane_io` directory.
