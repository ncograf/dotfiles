#!/usr/bin/python3

import os
import subprocess
import click
from pathlib import Path

def latex_template(name, title):
    return '\n'.join((
        r"\begin{figure}[H]",
        r"    \centering",
        rf"   \centerline{{\includegraphics[width=1.2\textwidth]{{./figures/{name}.jpg}}}}",
        rf"    \caption{{{title}}}",
        rf"    \label{{fig:{name}}}",
        r"\end{figure}"))

def indent(text, indentation=0):
    lines = text.split('\n');
    return '\n'.join(" " * indentation + line for line in lines)

@click.group()
def cli():
    pass

@cli.command()
@click.argument('title')
@click.argument(
    'root',
    default=os.getcwd(),
    type=click.Path(exists=False, file_okay=False, dir_okay=True)
)
def create(title, root):
    """
    Creates a figure.
    First argument is the title of the figure
    Second argument is the figure directory.
    """

    title = title.strip()
    file_name = title.replace(' ', '-').lower() + '.jpg'
    figures = Path(root).absolute()
    if not figures.exists():
        figures.mkdir()

    figure_path = figures / file_name

    # If a file with this name already exists, append a '2'.
    if figure_path.exists():
        print(title + ' 2')
        return

    # get screenshot and store it
    subprocess.run(["screenshot.sh", "file", figure_path])

    # Print the code for including the figure to stdout.
    # Copy the indentation of the input.
    leading_spaces = len(title) - len(title.lstrip())
    print(indent(latex_template(figure_path.stem, title), indentation=leading_spaces))

if __name__ == '__main__':
    cli()
