This uses multi stage build to export the built binaries


```bash
docker build --output type=local,dest=./artifacts .
```

At the end, you should see a folder named artifacts with all the slurm binaries

