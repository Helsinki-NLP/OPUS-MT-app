

STORAGE_URL     = https://object.pouta.csc.fi
MODEL_CONTAINER = Tatoeba-MT-models
MODEL_INDEX     = ${STORAGE_URL}/${MODEL_CONTAINER}/index.txt

MODEL_BASE_URL  = https://object.pouta.csc.fi/OPUS-MT-models/app
MODEL_NAME      = eng-fin.tatoeba.tiny

MODEL_ORIGINAL = tatoeba-mt/opusTCv20210807+bt.spm32k-spm32k.transformer-tiny-align.model1.npz.best-perplexity.npz


.PHONY: all
all: app/models.json

app/models.json: app/models/${MODEL_NAME}.tar.gz
	./generate_models_json.py $@ app/models/${MODEL_NAME}.tar.gz app/models/${MODEL_NAME} models ${MODEL_BASE_URL}


app/models/${MODEL_NAME}.tar.gz: app/models/${MODEL_NAME}/model.intgemm8.bin
	cd app/models && tar -czf ${notdir $@} ${MODEL_NAME}

app/models/${MODEL_NAME}/model.intgemm8.bin: ${MODEL_ORIGINAL}
	mkdir -p ${dir $@}
	../3rd_party/marian-dev/build/marian-conv -g intgemm8 -f $< -t $@

model-index.txt:
	wget -O $@ ${MODEL_INDEX}

