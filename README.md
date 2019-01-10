# cv

My resumé in LaTeX.

## Installing

LaTeX compiling is done via the [`soleo/latex`](https://github.com/soleo/docker-latex) Docker image.

```bash
docker pull soleo/latex
```

## Compiling

Define `docker-latex`

```bash
docker-latex() { docker run -v $PWD:/mnt/src --rm  soleo/latex:latest $@; return $?; }
```

Then:

```bash
docker-latex example.tex
```

This will create `example.pdf`