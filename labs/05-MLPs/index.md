---
layout: index
title: "AICE3002 / AICE6001: Introduction to Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 5 - Implementing simple Neural Networks using PyTorch and Torchbearer

_[Jonathon Hare, 9th Oct 2018; updated 22nd Sep 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20181009: Initial version
- 20200126: Minor updates for the 1920 AY
- 20260922: Updated for AICE3002/AICE6001 and current PyTorch/Torchbearer APIs

## Acknowledgements

This lab started out its life as a Keras practical developed for the VLC group based on Jason Brownlee's ["Handwritten Digit Recognition using Convolutional Neural Networks in Python with Keras"](http://machinelearningmastery.com/handwritten-digit-recognition-using-convolutional-neural-networks-python-keras/) tutorial. It subsequently evolved as it was used in tutorials run for external organisations including Ordnance Survey, Lloyds Register and DISCNet. 

This version is refocussed on using PyTorch with Torchbearer. A number of changes have been made to ensure that it better fits our format and I've also added additional information and exercises throughout. 

## Introduction

A popular demonstration of the capability of deep learning techniques is object recognition in image data. The "hello world" of object recognition for machine learning and deep learning is the MNIST dataset for handwritten digit recognition.

In this lab you will discover how to develop a simple neural network model to achieve good performance on the MNIST handwritten digit recognition task in Python using the PyTorch deep learning library.

Through this lab you'll learn how to:

* Load the MNIST dataset in PyTorch.
* Develop and evaluate a baseline neural network model for the MNIST problem.
* Run your code on the GPU.
* Use Torchbearer to simplify training of your models.

## Getting started

To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library, the `torchvision` utility library and the `torchbearer` model training library. We'll also use the `matplotlib`, `scikit-learn` and `numpy` packages. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 


<table style="width: 100%">
  <tbody>
    <tr>
      <td>5.1 Introducing MNIST</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_1_MNIST.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_1_MNIST.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/05-MLPs/5_1_MNIST.ipynb">download</a></td>
    </tr>
    <tr>
      <td>5.2 Implementing an MLP classifier</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_2_MLP.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_2_MLP.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/05-MLPs/5_2_MLP.ipynb">download</a></td>
    </tr>
    <tr>
      <td>5.3 Training and evaluating an MLP classifier with Torchbearer</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_3_Torchbearer.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_3_Torchbearer.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/05-MLPs/5_3_Torchbearer.ipynb">download</a></td>
    </tr>
    <tr>
      <td>5.4 Using GPU acceleration with PyTorch</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_4_GPU.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/05-MLPs/5_4_GPU.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/05-MLPs/5_4_GPU.ipynb">download</a></td>
    </tr>
  </tbody>
</table>
&nbsp;

## Prerequisites for running on your own machines

If you wish to run locally, you'll need access to a computer with the following installed:

- `Python` (>= 3.12)
- `notebook` (>= 5.4.1)
- `pytorch` (>= 2.6.0)
- `torchvision` (>= 0.21.0)
- `torchbearer` (>= 0.5.5)
- `NumPy` (>= 1.26)
- `scikit-learn` (>= 1.5)
- `matplotlib` (>= 3.8)

If you want to work on your own machine we recommend using the Anaconda python distribution. Running `conda install pytorch torchvision -c pytorch` (see https://pytorch.org/get-started/locally/ for more options) will install both pytorch and torchvision. Torchbearer can be installed with `pip install torchbearer`. With the exception of the part of the tutorial that looks at enabling hardware acceleration, the entire lab can be performed on the CPU - some bits of training could take up to a couple of minutes however.