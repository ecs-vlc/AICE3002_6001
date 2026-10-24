---
layout: index
title: "AICE3002 / AICE6001: Differentiable Programming and Deep Learning"
subtitle: "2026-27"
githubHeader: "false"
credits: Maintained by <a href="http://www.ecs.soton.ac.uk/people/jsh2">Professor Jonathon Hare</a> and <a href="http://www.ecs.soton.ac.uk/people/am8n17">Dr Antonia Marcu</a>.
rdir: '../../'
---

# Lab 8 - Recurrent Networks, Sequence Prediction and Embeddings

_[Jonathon Hare, 3rd March 2019; updated 23rd October 2026](https://github.com/ecs-vlc/AICE3002_6001)_

## Change History

- 20190303: Initial version
- 20200126: Minor updates for the 1920 AY
- 20230326: Additions for 2223 AY
- 20261023: Damian's fixes to remove torchtext; tidy notebooks.

## Acknowledgements
This lab started out its life as a Keras practical developed for Lloyds Register and DISCNet. The LSTM-based Nietzsche generator described in the first part of the lab is inspired by the Keras examples. The remaining parts of the lab are based around [Ben Trevett's](https://github.com/bentrevett/pytorch-sentiment-analysis) excellent PyTorch & TorchText tutorial ([MIT License](https://github.com/bentrevett/pytorch-sentiment-analysis/blob/master/LICENSE)). The current version uses Hugging Face Datasets and Gensim rather than depending on TorchText. 

This version is refocussed on using PyTorch with Torchbearer. A number of changes have been made to ensure that it better fits our format and I've also added additional information and exercises throughout. 

## Introduction
In this lab we'll use PyTorch to model and analyse sequence data using recurrent neural networks made from computational blocks called a "Long Short Term Memory", or LSTM. In the first part of the tutorial we'll explore how we can predict language - given a starting character, can we predict what will come next? We'll start by implementing a simple "1st-order Markov Chain" to learn the transition probabilities between characters, and we'll then compare this to a model that can learn longer-term dependencies using a recurrent neural network.

The second part will look at word embeddings, and we'll explore what kinds of things one can do with pre-trained embeddings.

The third part will look at sequence classification. Sequence classification is a predictive modeling problem where you have some sequence of inputs over space or time and the task is to predict a category for the sequence. What makes this problem difficult is that the sequences can vary in length, be comprised of a very large vocabulary of input symbols and may require the model to learn the long-term context or dependencies between symbols in the input sequence.

The fourth part of the tutorial will make us think twice about the use of recurrent neural networks, and look at the performance that can be achieved just by using feed-forward convolutions over time.

The final part uses a Transformer encoder--decoder for sequence-to-sequence translation.

Through this part of the tutorial you'll learn how to:

* How to learn a language model using a recurrent network & to sample the model to generate new language.
* How to use callbacks during training to monitor progress.
* How to use a word embedding to project one-hot encoded word vectors into a lower dimensional latent space.
* How to incorporate pre-trained word embeddings into your models.
* How to develop an LSTM model for a sequence classification problem.
* How to use temporal convolutions for sequence prediction tasks.
* How to use a Transformer encoder--decoder for sequence-to-sequence modelling.


## Getting started
To work through this lab you'll use the Python 3 language in a Jupyter Notebook environment, with the `pytorch` tensor library, the `torchvision` utility library and the `torchbearer` model training library. We'll also use the `matplotlib`, `scikit-learn` and `numpy` packages. We will primarily be using [Google Colab](http://colab.research.google.com/) to run the notebooks as this gives you access to an environment with all the tools required. If you wish to run the notebooks locally, see the information in the section below.

The following is a list of the notebooks for this lab, with links to open directly in Google Colab (once opened you should immediately save a copy in your Google Drive otherwise anything you do will be lost once the browser closes), or to download locally. You should work through the notebooks in numeric order as they follow on from each other. 

8.1 Modelling Sequences | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_1_SequenceModelling.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_1_SequenceModelling.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/08-sequence-models/8_1_SequenceModelling.ipynb)
8.2 Word Embeddings | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_2_WordEmbeddings.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_2_WordEmbeddings.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/08-sequence-models/8_2_WordEmbeddings.ipynb)
8.3 Sequence Classification | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_3_SequenceClassification.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_3_SequenceClassification.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/08-sequence-models/8_3_SequenceClassification.ipynb)
8.4 Convolutional Sequence Classification | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_4_CNNSequenceClassification.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_4_CNNSequenceClassification.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/08-sequence-models/8_4_CNNSequenceClassification.ipynb)
8.5 Transformer Encoder--Decoder | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_5_TransformerLM.ipynb) | [preview](https://github.com/ecs-vlc/AICE3002_6001/blob/main/labs/08-sequence-models/8_5_TransformerLM.ipynb) | [download](https://raw.githubusercontent.com/ecs-vlc/AICE3002_6001/main/labs/08-sequence-models/8_5_TransformerLM.ipynb)

## Prerequisites for running on your own machines
You'll need access to a computer with the following installed:

- `Python` (3.10 or later)
- `notebook`
- `torch` and `torchvision`
- `torchbearer`
- `NumPy`, `SciPy`, `scikit-learn` and `matplotlib`
- `spaCy` with the `en_core_web_sm` model
- Hugging Face `datasets`
- `gensim`

If you want to work on your own machine we recommend using the Anaconda python distribution to create an environment (`conda create -n <blah> python=3.12`) and then using `pip` to install the required packages (see [https://pytorch.org/get-started/locally/](https://pytorch.org/get-started/locally/) for platform & hardware specific instructions). 
