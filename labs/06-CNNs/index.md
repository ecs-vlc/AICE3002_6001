---
layout: index
title: "AICE3002 / AICE6001: Introduction to Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 6 - Implementing and training Convolutional Neural Networks using PyTorch and Torchbearer

_[Jonathon Hare, 2nd Nov 2018; updated 22nd Sep 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20181102: Initial version
- 20200126: Minor updates for the 1920 AY
- 20260922: Updated for AICE3002/AICE6001 and current PyTorch/Torchbearer APIs
- 20260922: Added residual connections to the advanced-networks notebook

## Acknowledgements

This lab started out its life as a Keras practical developed for the VLC group based on Jason Brownlee's ["Handwritten Digit Recognition using Convolutional Neural Networks in Python with Keras"](http://machinelearningmastery.com/handwritten-digit-recognition-using-convolutional-neural-networks-python-keras/) tutorial. It subsequently evolved as it was used in tutorials run for external organisations including Ordnance Survey, Lloyds Register and DISCNet. 

This version is refocussed on using PyTorch with Torchbearer. A number of changes have been made to ensure that it better fits our format and I've also added additional information and exercises throughout. 

## Introduction

In the last lab we saw how to implement and train simple multi-layer perceptrons using PyTorch and Torchbearer.

In this lab you will discover how to develop Convolutional deep learning models to explore the MNIST handwritten digit recognition task in Python using the PyTorch deep learning library.

Through this lab you'll learn how to:

* Implement and evaluate a simple Convolutional Neural Network for MNIST.
* Implement a stronger multi-layer CNN for MNIST.
* Serialise and deserialise trained models.
* Load your own image created outside of the MNIST dataset, and pass it through the network.
* Visualise the filters learned by the network.
* Implement networks with branching, merging, and residual connections.

## Getting started

To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library, the `torchvision` utility library and the `torchbearer` model training library. We'll also use the `matplotlib`, `scikit-learn` and `numpy` packages. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 


<table style="width: 100%">
  <tbody>
    <tr>
      <td>6.1 Training and evaluating simple CNNs</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_1_CNN.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_1_CNN.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/06-CNNs/6_1_CNN.ipynb">download</a></td>
    </tr>
    <tr>
      <td>6.2 Loading a saved model</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_2_Loading.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_2_Loading.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/06-CNNs/6_2_Loading.ipynb">download</a></td>
    </tr>
    <tr>
      <td>6.3 Visualising Convolutional Networks</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_3_Visualise.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_3_Visualise.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/06-CNNs/6_3_Visualise.ipynb">download</a></td>
    </tr>
    <tr>
      <td>6.4 More advanced networks</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_4_Topologies.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/06-CNNs/6_4_Topologies.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/06-CNNs/6_4_Topologies.ipynb">download</a></td>
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

If you want to work on your own machine we recommend using the Anaconda python distribution. Running `conda install pytorch torchvision -c pytorch` (see https://pytorch.org/get-started/locally/ for more options) will install both pytorch and torchvision. Torchbearer can be installed with `pip install torchbearer`. This lab can be run without hardware acceleration, but it will be slow!