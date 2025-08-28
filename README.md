# shirokane_io
Directory for managing data input/output between your local environment and SHIROKANE HPC.

## :wrench: Setup
Add the following lines to your `.bashrc` or `.zshrc`:

```bash
export SHIROKANE_ID=$your_user_id
[ -f "$parent_dirs/shirokane_io/io.sh" ] && source "$parent_dirs/shirokane_io/io.sh"
```
Make sure to replace `$your_user_id` with your actual SHIROKANE login ID,
and update `$parent_dirs` to the absolute or relative path leading to the `shirokane_io` directory.~

## :rocket: Usage
### :outbox_tray: `to_shirokane`
Uploads files or directories to SHIROKANE:
```bash
to_shirokane [scp_options] <local_path> <remote_path>
```
Example:
```
to_shirokane -r "~/results" results
```

### :inbox_tray: `from_shirokane`
Download files or directories from SHIROKANE into `shirokane_io/download/`:
```bash
from_shirokane [scp_options] <remote_path> <local_name>
```
Example:
```bash
from_shirokane -r "~/project/data" my_data
```
This will save the remote `~/project/data` into:
```bash
shirokane_io/download/my_data
```
To download a file into the base `download/` directory with the original filename:
```bash
from_shirokane "~/project/data.csv" .
```
### :pushpin: Notes
- Quoting `~` in in remote paths is required: use `"~/path"` instead of `~/path`
- The download destination is automatically created under `shirokane_io/download/` for safety and organization.
- `scp` options such as `-r` are fully supported.
