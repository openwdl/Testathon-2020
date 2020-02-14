# [OpenWDL Testathon, Feb 18-19, 2020](https://support.terra.bio/hc/en-us/articles/360039208432-Announcing-the-OpenWDL-Testathon-Feb-18-19-2020)

This repo includes a [pytest-wdl](https://github.com/EliLillyCo/pytest-wdl) skeleton for developing test cases for the WDL language specification. While this is suggested as a "shovel-ready" starting point for participants, other testing frameworks and approaches are equally welcomed, as one of the Testathon's goals is to develop general best practices for WDL testing.

## Getting Started

Platform requirements:

| | Linux | macOS |
| - | ----- | ----- |
| Python 3.6+ & pip | e.g. `apt-get install python3 python3-pip` | install from [Homebrew](https://formulae.brew.sh/formula/python) (`Python3.framework` may work, with [caveat](https://stackoverflow.com/questions/57630314/ssl-certificate-verify-failed-error-with-python3-on-macos-10-15)) |
| docker | (i) e.g. `apt-get install docker.io`, (ii) [empower user to control it](https://docs.docker.com/install/linux/linux-postinstall/) | set up [Docker Desktop for Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac) |
| Java 8+ | e.g. `apt-get install default-jre-headless` | run `java` in Terminal to trigger dialog (alternative: [AdoptOpenJDK](https://adoptopenjdk.net/?variant=openjdk11&jvmVariant=hotspot)) |

Booting up:

0. *(if desired)* create & enter a python virtualenv
1. [Fork this GitHub repository](https://github.com/openwdl/Testathon-2020)
2. Clone your fork to working directory: 
```git clone git@github.com:GITHUB_USERNAME/Testathon-2020.git && cd Testathon-2020```
3. Add upstream for later use:
```git remote add upstream https://github.com/openwdl/Testathon-2020.git```
4. Install [pytest-wdl](https://pypi.org/project/pytest-wdl/) and any other dependencies:
```pip3 install --user -r requirements.txt```
5. Download [Cromwell JAR](https://github.com/broadinstitute/cromwell/releases/download/48/cromwell-48.jar) to some known location
6. `cp pytest_wdl_config.json $HOME` and edit the copy so that `cromwell_jar_file` has the correct location

## Invoking test suite

```
pytest .
```

Once comfortable, run tests in parallel to reduce total time:

```
pytest -n 10 -v .
```

## Test suite structure

We've seeded four broad categories of test cases in this repository:

* `tests/expr`: parsing, type-checking, and evaluation of basic WDL expressions
* `tests/stdlib`: standard library functions
* `tests/task`: task-level runner functionality
* `tests/workflow`: workflow-level runner functionality

These categories reflect the intended focus within, but aren't mutually exclusive (for example, a `scatter{}` workflow can be useful to iterate more-basic tests on varying inputs). More categories might be needed, such as for structs and imports.

Each folder within these categories provides a [pytest-wdl](https://github.com/EliLillyCo/pytest-wdl) test case including,

* .wdl file
* short Python file describing how to invoke the workflow and its expected outputs (with the `workflow_runner` fixture)
* optionally, a `test-data.json` file describing any needed data assets (with the `workflow_data` fixture)

The [pytest-wdl manual](https://pytest-wdl.readthedocs.io/en/stable/index.html) has full detail on these fixtures.

## Adding tests

New tests can be added by copying an existing test case directory alongside, and renaming+rewriting the files within as needed. Pytest automatically discovers all `test_*.py` files in the directory tree.

Documentation: at minimum, each Python file should include a docstring describing the focus.

Send pull requests with new test cases upstream via GitHub. And sync up with the latest from time to time, `git fetch upstream && git merge upstream/master` ([rebase](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) if you dare).
