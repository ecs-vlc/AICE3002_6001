---
layout: index
title: "AICE3002 / AICE6001: Introduction to Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 7 - Using pretrained models and transfer learning

_[Jonathon Hare, 9th Oct 2018; updated 22nd Sep 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20181009: Initial version
- 20200126: Minor updates for the 1920 AY
- 20260922: Updated for AICE3002/AICE6001 and current torchvision APIs

## Acknowledgements
This lab started out its life as a Keras practical developed for the VLC group based on Jason Brownlee's ["Handwritten Digit Recognition using Convolutional Neural Networks in Python with Keras"](http://machinelearningmastery.com/handwritten-digit-recognition-using-convolutional-neural-networks-python-keras/) tutorial. It subsequently evolved as it was used in tutorials run for external organisations including Ordnance Survey, Lloyds Register and DISCNet. 

This version is refocussed on using PyTorch with Torchbearer. A number of changes have been made to ensure that it better fits our format and I've also added additional information and exercises throughout. 

## Introduction
Now we've seen how we can use PyTorch to work towards the solution of a handwriting recognition problem, we'll turn our focus to data that is more realistic, using deep-learning models that are much closer to state of the art. The problem with using better models is that we need massive amounts of labelled data to train these models from scratch, and also large amounts of time (typically days of training, even using multiple GPUs). Rather than training from scratch we'll explore using transfer learning and fine-tuning using pre-trained models. The pre-trained models that we'll play with were trained using the ImageNet dataset, which consists of about 1.3 million images in 1000 classes.

Through this lab you'll learn how to:

* Load image data from the file system
* Develop and evaluate a simple CNN for classification.
* Load a pre-trained model and use it to make classifications.
* Modify and fine-tune a pre-trained model to solve a classification problem.
* Extract _semantic_ features that can be used for transfer learning and finding similar features.

## Getting started
To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library, the `torchvision` utility library and the `torchbearer` model training library. We'll also use the `matplotlib`, `scikit-learn` and `numpy` packages. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

There is only a single (long) notebook this week to simplify the use of external datasets on Colab. Use the link to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. 

<table style="width: 100%">
  <tbody>
    <tr>
      <td>7.1 Transfer Learning and Fine Tuning</td>
      <td><a href="https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/07-transfer-learning/7_1_TransferLearning.ipynb"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"></a></td>
      <td><a href="https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/07-transfer-learning/7_1_TransferLearning.ipynb">preview</a></td>
      <td><a href="https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/07-transfer-learning/7_1_TransferLearning.ipynb">download</a></td>
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

If you want to work on your own machine we recommend using the Anaconda python distribution. Running `conda install pytorch torchvision -c pytorch` (see https://pytorch.org/get-started/locally/ for more options) will install both pytorch and torchvision. Torchbearer can be installed with `pip install torchbearer`.
