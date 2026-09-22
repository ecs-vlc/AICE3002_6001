---
layout: index
title: "AICE3002 / AICE6001: Introduction to Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 4 - Linear Models

_[Jonathon Hare, 7th Feb 2023; updated 22nd Sep 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20181219: Initial version
- 20200126: Minor updates for the 1920 AY
- 20230107: Dataset fixes for first part made by Jiahui Liu
- 20260111: Update instructions for installing PyTorch
- 20260202: Fix typos etc spotted by Damian Smith
- 20260922: Refocused as the Linear Models lab and added an `nn.Linear` comparison

## Acknowledgements

This lab is heavily inspired by Stanford's 'Unsupervised Feature Learning and Deep Learning' tutorial (originally written by Andrew Ng and team), and Andrei Karpathy's cs213n course (also from Stanford). The bottom-up approach taken by these courses provides a sound grounding in understanding the fundamentals that make differentiable programming and deep learning possible. 

## Introduction

This lab revisits three important linear models: linear regression, logistic regression, and softmax regression. We will implement their core computations directly in PyTorch so that the relationship between the mathematical model, its parameters, its loss, and its optimisation remains visible.

The tensor-programming material from Lab 1 and the automatic-differentiation and optimisation material from Labs 2 and 3 are assumed here. The final activity compares the hand-crafted softmax regressor with the equivalent model built from `nn.Linear`, autograd, a standard optimiser, and `CrossEntropyLoss`.

Through this lab you'll learn how to:

* Implement a linear regression model using the pseudoinverse;
* Optimise the parameters of a linear regressor using gradient descent;
* Implement and check logistic regression;
* Implement softmax regression; and
* Relate a hand-crafted linear classifier to PyTorch's `nn.Linear` abstraction.

## Getting started

To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library and `matplotlib` package to draw graphs. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 

<table style="width: 100%">
  <tbody>
    <tr>
      <td>4.1 Linear Regression</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_1_linear_regression.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_1_linear_regression.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/04-linear-models/1_1_linear_regression.ipynb">download</a></td>
    </tr>
    <tr>
      <td>4.2 Logistic Regression</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_2_logistic_regression.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_2_logistic_regression.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/04-linear-models/1_2_logistic_regression.ipynb">download</a></td>
    </tr>
    <tr>
      <td>4.3 Softmax Regression</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_3_softmax_regression.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/04-linear-models/1_3_softmax_regression.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/04-linear-models/1_3_softmax_regression.ipynb">download</a></td>
    </tr>
  </tbody>
</table>
&nbsp;

## Prerequisites for running on your own machines

If you wish to run locally, you'll need access to a computer with the following installed:

- `Python` (>= 3.12)
- `notebook` (>=5.4.1)
- `pytorch` (>= 2.6.0)
- `matplotlib` (>= 2.2.2)

If you want to work on your own machine we recommend using the Anaconda python distribution to create an environment (`conda create -n <blah> python=3.12`) and then using `pip` to install the required packages (see [https://pytorch.org/get-started/locally/](https://pytorch.org/get-started/locally/) for platform & hardware specific instructions). 
