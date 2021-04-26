# Bilingual

A repository for interactive Python & R development using the [Atom IDE](https://atom.io/).

## Features

A preconfigured development environment for bilingual Python and R development using the [Atom IDE](https://atom.io/), the [Hydrogen](https://atom.io/packages/hydrogen) package, and the [`jupyter/all-spark-notebook`](https://hub.docker.com/r/jupyter/all-spark-notebook) kernel.

Allows for interactive Python & R development side-by-side in the Atom IDE.

Uses a single container for remote Python & R kernels.

## Motivation

I use Python and R for development in the same projects. Many of my projects use Python and R side-by-side.

Previously, I used [RStudio](https://www.rstudio.com/) for R development and [Atom](https://atom.io/) for Python development. Switching between IDEs greatly increases the friction in a project, especially because I typically conduct heavy analysis and data processing in Python and use R for visualisation.

Switching IDEs is cumbersome and time consuming.

I have also been unimpressed by the RStudio solutions for running Python code ([Reticulate](https://rstudio.github.io/reticulate/)). While you can technically run Python code interactively in RStudio, you sacrifice code styling in your IDE and can have trouble managing your python kernel.

This approach provides a unified, Jupyter-like, interface for running Python and R code in the same IDE.

## Usage

Clone this repository:

``` {bash}
git clone https://github.com/hamishgibbs/bilingual.git
```

Enter the cloned repository and create an environment file with a token for your Jupyter kernel:

``` {bash}
echo "JUPYTER_TOKEN=super_secret" >> .env
```

The `super_secret` token is not very secure... You should provide your own token.

Build the Jupyter container with:

``` {bash}
docker-compose build
```

Run the Jupyter container with:

``` {bash}
docker-compose up
```

To check if the kernel is running successfully, check out [http://127.0.0.1:8888/?token=super_secret](http://127.0.0.1:8888/?token=super_secret) (replacing the token with your own).


You can now connect the Hydrogen package in your Atom IDE to this remote kernel. See [this](https://nteract.gitbooks.io/hydrogen/content/docs/Usage/RemoteKernelConnection.html) tutorial for step by step instructions.

Once you have configured Hydrogen to find your remote kernel, open one of the example files (`test.py` or `test.R`).

Connect to the remote kernel with `cmd-shift-p`, search for `Hydrogen: Connect to a remote kernel`, and select the appropriate kernel.

Run the file and check that everything is working alright (`cmd-enter`).

**Note:** you may need to install the [`language-r`](https://atom.io/packages/language-r) package in Atom. You can find some more info in [this issue](https://github.com/nteract/hydrogen/issues/909).

**Note:** You can use the remote kernel in any project directory - or incorporate this repo as a part of individual projects. Whatever you prefer. There is no project state that is saved in the container when using the Jupyter kernel.

## Additional Information

A few more notes about bilingual Python & R development in Python.

A nice feature when developing in RStudio is easy access to R-specific keyboard shortcuts like pipes `%<%` (if you are into that kind of thing) and variable assignment `<-`.

Follow [this](http://www.goring.org/resources/atom_and_r.html) tutorial to add these handy shortcuts to your Atom installation.
