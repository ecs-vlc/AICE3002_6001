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

You will likely need to refer to the "autograd" lecture slides for this lab - you can get those here: [https://ecs-vlc.github.io/AICE3002_6001/lectures/autograd.pdf](https://ecs-vlc.github.io/AICE3002_6001/lectures/autograd.pdf).

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 

| Part | Notebook | Colab |
|---|---|---|
| 0 | [A gentle introduction to tensors](1_0_tensor_primer.ipynb) | [Open in Colab](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/01-tensors/1_0_tensor_primer.ipynb) |
| 1 | [Tensor fundamentals](1_1_tensor_fundamentals.ipynb) | [Open in Colab](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/01-tensors/1_1_tensor_fundamentals.ipynb) |
| 2 | [Vectorisation, batching, and broadcasting](1_2_vectorisation_batching.ipynb) | [Open in Colab](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/01-tensors/1_2_vectorisation_batching.ipynb) |


## Prerequisites for running on your own machines

You'll need access to a computer with the following installed:

- `Python` (>= 3.12)
- `notebook` (>=5.4.1)
- `pytorch` (>= 2.6.0)

If you want to work on your own machine we recommend using the Anaconda python distribution to create an environment (`conda create -n <blah> python=3.12`) and then using `pip` to install the required packages (see [https://pytorch.org/get-started/locally/](https://pytorch.org/get-started/locally/) for platform & hardware specific instructions). 
