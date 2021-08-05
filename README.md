# docker-sccb2

Dockerized scCB2

## Description / References

CB2 is a cluster-based approach for distinguishing true cells from background barcodes in droplet-based single cell RNA-seq experiments (especially for 10X Chromium output), while scCB2 is its corresponding R package.

- GitHub: https://github.com/zijianni/scCB2
- Bioconductor: https://bioconductor.org/packages/release/bioc/html/scCB2.html
- Vignette: https://bioconductor.org/packages/3.12/bioc/vignettes/scCB2/inst/doc/scCB2.html

>Ni Z, Chen S, Brown J, Kendziorski C (2020). “CB2 improves power of cell detection in droplet-based single-cell RNA sequencing data.” Genome Biology. [doi: 10.1186/s13059-020-02054-8](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-020-02054-8).

## Build Container Image

```bash
./build.sh
```

## Push to Docker Registry

Either you can use the `docker push` command or run `push.sh` (requires [SCING](https://github.com/hisplan/scing)):

```bash
./push.sh
```

## Test

Run a simple smoke test which loads the scCB2 library and displays the version number:

```bash
$ ./run-smoke-test.sh

[1] "scCB2 v1.2.0"
```
