---
layout: index
title: "AICE3002 / AICE6001: Introduction to Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 1 — Tensor programming with PyTorch

_[Jonathon Hare, 3rd Sep 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20260903: Initial version

Deep-learning programs operate on batches of structured data. Before we introduce automatic differentiation and neural-network construction, this lab develops the tensor-programming skills that the rest of the course assumes.

By the end of the lab you should be able to:

* create tensors with appropriate shapes, dtypes, and devices;
* explain what each axis of a tensor represents;
* reshape, permute, index, and reduce tensors safely;
* use broadcasting deliberately rather than by trial and error;
* replace Python loops with vectorised and batched operations;
* check that alternative implementations produce the same result; and
* benchmark PyTorch operations without drawing conclusions from a single timing.

## Getting started

To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 


1.0 A gentle introduction to tensors | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/01-tensors/1_0_tensor_primer.ipynb) | [preview](https://github.com/ecs-vlc/ecs-vlc/AICE3002_6001/blob/main/labs/01-tensors/1_0_tensor_primer.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/master/docs/labs/01-tensors/1_0_tensor_primer.ipynb)
1.1 Reverse Mode Automatic Differentiation | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/master/labs/01-tensors/1_1_tensor_fundamentals.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/master/docs/labs/01-tensors/1_1_tensor_fundamentals.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/master/docs/labs/01-tensors/1_1_tensor_fundamentals.ipynb)
1.2 Automatic Differentiation in PyTorch | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/master/labs/01-tensors/1_2_vectorisation_batching.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/master/docs/labs/01-tensors/1_2_vectorisation_batching.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/master/docs/labs/01-tensors/1_2_vectorisation_batching.ipynb)


## Prerequisites for running on your own machines

You'll need access to a computer with the following installed:

- `Python` (>= 3.12)
- `notebook` (>=5.4.1)
- `pytorch` (>= 2.6.0)

If you want to work on your own machine we recommend using the Anaconda python distribution to create an environment (`conda create -n <blah> python=3.12`) and then using `pip` to install the required packages (see [https://pytorch.org/get-started/locally/](https://pytorch.org/get-started/locally/) for platform & hardware specific instructions). 
