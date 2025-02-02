Our Model for SemEval task 8
==========
  

## Requirements

Our model was trained on GPU (compute canada) .  

- Python 3 (tested on 3.6.8)

- PyTorch (tested on 1.3.1)

- CUDA (tested on 8.0)

- tqdm

- unzip, wget (for downloading only)

We added the evaluation result on the SemEval dataset in semeval_evaluation_output.txt file. There is no guarantee that the model is the same as we released and reported if you run the code on different environments (including hardware and software). 

## Preparation
We have already put the JSON files under the directory `dataset/semeval`.

  
First, download and unzip GloVe vectors:

```
chmod +x download.sh; ./download.sh
```

  
Then prepare vocabulary and initial word vectors with:

```
python3 prepare_vocab.py dataset/semeval dataset/vocab --glove_dir dataset/glove
```

  

This will write vocabulary and word vectors as a numpy matrix into the dir `dataset/vocab`.

  

## Training

  

To train the oue model, run:

```
bash train_aggcn.sh
```

  

Model checkpoints and logs will be saved to `./saved_models/01`.

  

For details on the use of other parameters, please refer to `train.py`.

  

## Evaluation

Our pretrained model is saved under the dir saved_models/01. To run evaluation on the test set, run:

```
python3 eval.py saved_models/01 --dataset test
```



