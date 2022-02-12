Graph Attention Auto-Encoder for Relation Extraction
============================

This repo contains the *PyTorch* code for project [Graph Attention Auto-Encoder for Relation Extraction]

This project/code introduces a novel approach where we apply Graph Attention Auto Encoder (GATE) upon the adjacency matrix of Graph Convolutional Networks (GCNs) and the feature vector of each node. We also use Bi-LSTM, which gives us a better contextual representation of the sentences Compared to sequence models such as various LSTM-based models.

See below for an overview of the model architecture:

## Requirements

- Python 3 (tested on 3.6.5)
- PyTorch (tested on 0.4.0)
- tqdm
- unzip, wget (for downloading only)

## Preparation

We include the SemEval Dataset.

First, download and unzip GloVe vectors from the Stanford NLP group website, with:
```
chmod +x download.sh; ./download.sh
```

Then prepare vocabulary and initial word vectors with:
```
python prepare_vocab.py dataset/tacred dataset/vocab --glove_dir dataset/glove
```

This will write vocabulary and word vectors as a numpy matrix into the dir `dataset/vocab`.

## Training

To train a graph convolutional neural network (GCN) model, run:
```
bash train_gcn.sh 0
```

Model checkpoints and logs will be saved to `./saved_models/00`.

To train a Contextualized GCN (C-GCN) model, run:
```
bash train_cgcn.sh 1
```

Model checkpoints and logs will be saved to `./saved_models/01`.

For details on the use of other parameters, such as the pruning distance k, please refer to `train.py`.

## Evaluation

To run evaluation on the test set, run:
```
python eval.py saved_models/00 --dataset test
```

This will use the `best_model.pt` file by default. Use `--model checkpoint_epoch_10.pt` to specify a model checkpoint file.

## Retrain

Reload a pretrained model and finetune it, run:
```
python train.py --load --model_file saved_models/01/best_model.pt --optim sgd --lr 0.001
```

## Related Repo

The paper also includes comparisons to the position-aware attention LSTM (PA-LSTM) model for relation extraction. To reproduce the corresponding results, please refer to [this repo](https://github.com/yuhaozhang/tacred-relation).




