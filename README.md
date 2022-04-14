Multi-Head Attention with Relative Positional Encoding for Relation Extraction.
==========

This code introduces the Multi-Head Attention with Relative Positional Encoding for Relation Extraction over dependency trees for the large scale sentence-level relation extraction task.



## Requirements

Our model was trained on GPU from Compute Canada.  

- Python 3 (tested on 3.6.8)

- PyTorch (tested on 0.4.1)

- CUDA (tested on 9.0)

- tqdm

- unzip, wget (for downloading only)


There is no guarantee that the model is the same as we released and reported if you run the code on different environments (including hardware and software). If you train the model by using the default setting, you will get the exact same output.

## Preparation


For TACRED and Semeval-10 Task 8, we have attached the preprocessed dataset under the directory `dataset/tacred` and `dataset/semeval`, respectively.

  
First, download and unzip GloVe vectors:

```
chmod +x download.sh; ./download.sh
```

  

Then prepare vocabulary and initial word vectors with: (We include vocab_run.sh for running this code in compute canada)

```
python3 prepare_vocab.py dataset/tacred dataset/vocab --glove_dir dataset/glove
```

  

This will write vocabulary and word vectors as a numpy matrix into the dir `dataset/vocab`.

  

## Training

  

To train our model, run (this bash file is prepared for running the code in compute canada):

```
sbatch train_aggcn.sh
```

  

Model checkpoints and logs will be saved to `./saved_models/01`.

  

For details on the use of other parameters, please refer to `train.py`.

  

## Evaluation

  

Our pretrained model is saved under the dir saved_models/01. To run evaluation on the test set, run:

```
python3 eval.py saved_models/01 --dataset test
```

  
## Related Repo

Codes are adapted from the repo (https://github.com/Cartus/AGGCN) [Attention Guided Graph Convolutional Networks for Relation Extraction].
 The paper uses the model DCGCN, for detail architecture please refer to the TACL19 paper [Densely Connected Graph Convolutional Network for Graph-to-Sequence Learning](https://github.com/Cartus/DCGCN). 


