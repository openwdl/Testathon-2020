# [OpenWDL Testathon, Feb 18-19, 2020](https://support.terra.bio/hc/en-us/articles/360039208432-Announcing-the-OpenWDL-Testathon-Feb-18-19-2020)

This repo includes a [pytest-workflow](https://github.com/LUMC/pytest-workflow) 
skeleton for developing test cases for the WDL language specification. While 
this is suggested as a "shovel-ready" starting point for participants, other 
testing frameworks and approaches are equally welcomed, as one of the 
Testathon's goals is to develop general best practices for WDL testing.

## Getting Started

Platform requirements:

| | Linux | macOS |
| --- | ----- | ----- |
| miniconda | [Linux install instructions](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)| [Mac OS install instructions](https://conda.io/projects/conda/en/latest/user-guide/install/macos.html) |
| docker | (i) e.g. `apt-get install docker.io`, (ii) [empower user to control it](https://docs.docker.com/install/linux/linux-postinstall/) | set up [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) |


Booting up:

1. [Fork this GitHub repository](https://github.com/openwdl/Testathon-2020)
2. Clone your fork to working directory: 
```git clone git@github.com:GITHUB_USERNAME/Testathon-2020.git && cd Testathon-2020```
3. Add upstream for later use:
```git remote add upstream https://github.com/openwdl/Testathon-2020.git```
4. Install dependencies using `conda env create -f environment.yml`
5. Activate the conda environment with `conda activate testathon2020`

## Invoking test suite

```
pytest .
```

Once comfortable, run tests in parallel to reduce total time:

```
pytest --wt 10 -v .
```

Or run just one test:

```
pytest tests/expr/optional_interpolation
```

All cromwell and miniwdl tests are tagged with `cromwell` and `miniwdl` 
respectively. To test only cromwell test use `pytest --tag cromwell` and to
only test miniwdl use `pytest --tag miniwdl`.

## Test suite structure

We've seeded four broad categories of test cases in this repository:

* `tests/expr`: parsing, type-checking, and evaluation of basic WDL expressions
* `tests/stdlib`: standard library functions
* `tests/task`: task-level runner functionality
* `tests/workflow`: workflow-level runner functionality

These categories reflect the intended focus within, but aren't mutually 
exclusive (for example, a `scatter{}` workflow can be useful to iterate 
more-basic tests on varying inputs). More categories might be needed, such as 
for structs and imports.

Each folder within these categories provides a [pytest-workflow](
https://github.com/LUMC/pytest-workflow) test case including,

* .wdl file
* YAML file describing the test
* Optionally, JSON input files to be used by Cromwell and Miniwdl.
* Optionally, a python file, for tests that can not be covered by the YAML
  file.

The [pytest-workflow manual](https://pytest-workflow.readthedocs.io/) has full 
details on the use of pytest-workflow for testing.

## Adding tests

New tests can be added by copying an existing test case directory alongside, 
and renaming+rewriting the files within as needed. Pytest automatically 
discovers all `test_*.yml` and `test_*.py` files in the directory tree.

Documentation: at minimum, each YAML file should include a comment describing 
the focus.

Send pull requests with new test cases upstream via GitHub. And sync up with 
the latest from time to time, `git fetch upstream && git merge upstream/master` 
([rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) if you dare).
