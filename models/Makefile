#
# create model packages and update the catalog
#

## add all models to RELEASED_MODELS that you want to include

STORAGE_URL     = https://object.pouta.csc.fi
MODEL_CONTAINER = Tatoeba-MT-models
MODEL_INDEX     = ${STORAGE_URL}/${MODEL_CONTAINER}/index.txt
RELEASED_MODELS = swe-fin/opusTCv20210807+nopar+ft95-2022-01-19.zip


## set the path to marian-conv
## NOTE: need to have the bergamot fork of marian-nmt!

APPLHOME          = ${HOME}/projappl/install
BROWSERMT_HOME    = ${APPLHOME}/browsermt
BROWSERMT_CONVERT = ${BROWSERMT_HOME}/marian-dev/build/marian-conv


MODEL         = ${firstword ${RELEASED_MODELS}}
MODEL_URL    := ${STORAGE_URL}/${MODEL_CONTAINER}/${MODEL}
LANGPAIRID   := ${subst /,,${dir ${MODEL}}}
LANGPAIR     := ${shell iso639 -p -n ${LANGPAIRID} | sed 's/\"//g' }
SRC          := ${firstword ${subst -, ,${LANGPAIRID}}}
TRG          := ${lastword ${subst -, ,${LANGPAIRID}}}
SRCLANG      := ${firstword ${subst -, ,${LANGPAIR}}}
TRGLANG      := ${lastword ${subst -, ,${LANGPAIR}}}
RELEASE_DATE := ${shell echo '${basename ${MODEL}}' | rev | cut -f1-3 -d\- | rev}
VERSION      := ${shell echo '${basename ${MODEL}}' | rev | cut -f2-3 -d\- | rev | tr '-' '.'}

CATALOG      := app/models.json


## temporary dir for storing the model
MODEL_WORKDIR  = tmp/${basename ${MODEL}}

ifneq (${wildcard ${MODEL_WORKDIR}/README.md},)
  MODEL_TYPE = $(subst -align,,${shell grep 'model:' ${MODEL_WORKDIR}/README.md | head -1 | cut -f2 -d: | xargs})
  MODEL_DATA = ${shell grep 'dataset:' ${MODEL_WORKDIR}/README.md | head -1 | cut -f2 -d: | xargs}
  MODEL_NAME = ${LANGPAIRID}.$(subst -align,,${MODEL_TYPE})
  MODEL_FILE      = $(firstword ${wildcard ${MODEL_WORKDIR}/*.npz})
  MODEL_SHORTLIST = $(firstword ${wildcard ${MODEL_WORKDIR}/*lex-s2t*.bin})
  MODEL_SRCSPM    = ${MODEL_WORKDIR}/source.spm
  MODEL_TRGSPM    = ${MODEL_WORKDIR}/target.spm
endif


MODEL_BASE_URL  = https://object.pouta.csc.fi/OPUS-MT-models/app
MODEL_DIR	= app/models/${MODEL_NAME}
MODEL_DIST	= ${MODEL_DIR}.tar.gz


.PHONY: all
all:
	mkdir -p app
	wget -O ${CATALOG} ${MODEL_BASE_URL}/models.json
	for m in ${RELEASED_MODELS}; do \
	  ${MAKE} MODEL=$$m convert; \
	done

.PHONY: convert
convert: ${MODEL_WORKDIR}
	${MAKE} dist

.PHONY: fetch catalog config model dist update
fetch:   ${MODEL_WORKDIR}
catalog: ${MODEL_DIR}/catalog-entry.yml
config:  ${MODEL_DIR}/config.intgemm8bitalpha.yml
model:   ${MODEL_DIR}/catalog-entry.yml
dist:    ${MODEL_DIST}
update:  ${CATALOG}


.PHONY: info
info:
	@echo "       model: ${MODEL}"
	@echo "langpair IDs: ${LANGPAIRID}"
	@echo "    langpair: ${LANGPAIR}"
	@echo "     version: ${VERSION}"
	@echo "  model name: ${MODEL_NAME}"
	@echo "  model type: ${MODEL_TYPE}"
	@echo "  model data: ${MODEL_DATA}"

${MODEL_DIST}:
	${MAKE} model
	cd ${dir $@} && tar -czf ${notdir $@} ${notdir $(@:.tar.gz=)}
	${MAKE} update
	${MAKE} cleanup

${CATALOG}: ${MODEL_DIST}
	./generate_models_json.py ${CATALOG} ${MODEL_DIST} ${MODEL_DIR} models ${MODEL_BASE_URL}

.PHONY: cleanup
cleanup:
ifneq (${MODEL},)
ifneq ($(wildcard ${MODEL_WORKDIR}),)
	rm -f ${MODEL_WORKDIR}/*
	rmdir ${MODEL_WORKDIR}
endif
endif
ifneq (${MODEL_NAME},)
ifneq ($(wildcard ${MODEL_DIR}),)
	rm -f ${MODEL_DIR}/*
	rmdir ${MODEL_DIR}
endif
endif

${MODEL_DIR}/model.intgemm8.bin: ${MODEL_FILE}
	mkdir -p $(dir $@)
	${BROWSERMT_CONVERT} -g intgemm8 -f $< -t $@

${MODEL_DIR}/vocab.src.spm: ${MODEL_SRCSPM}
	mkdir -p $(dir $@)
	cp $< $@

${MODEL_DIR}/vocab.trg.spm: ${MODEL_TRGSPM}
	mkdir -p $(dir $@)
	cp $< $@

${MODEL_WORKDIR}:
	mkdir -p $@
	wget -O $@/model.zip ${MODEL_URL}
	cd $@ && unzip model.zip
	rm -f $@/model.zip

MODEL_WEBPAGE = https://github.com/Helsinki-NLP/Tatoeba-Challenge/tree/master/models/${LANGPAIRID}

## some manipulation of the MODEL_TYPE
MODELINFO_TYPE = $(subst 11,,${subst transformer-,,${MODEL_TYPE}})

${MODEL_DIR}/catalog-entry.yml: ${MODEL_DIR}/model_info.json
	mkdir -p ${dir $@}
	@echo 'name: "opusMT/${MODEL_NAME}"'                                                 > $@
	@echo 'curator: { name: "Joerg Tiedemann", contact: "jorg.tiedemann@helsinki.fi" }' >> $@
	@echo 'license: "CC-BY-SA-4.0"'                                                     >> $@
	@echo 'webpage: "${MODEL_WEBPAGE}"'                                                 >> $@
	@echo 'description: "${LANGPAIR} ${MODELINFO_TYPE} model (${MODEL_DATA})"'          >> $@

${MODEL_DIR}/model_info.json: ${MODEL_DIR}/config.intgemm8bitalpha.yml
	@echo '{'                                                  > $@
	@echo '  "modelName": "${LANGPAIR} ${MODELINFO_TYPE}",'   >> $@
	@echo '  "shortName": "${LANGPAIRID}-${MODELINFO_TYPE}",' >> $@
	@echo '  "type":      "${MODEL_TYPE}",'                   >> $@
	@echo '  "src":       "${SRCLANG}",'                      >> $@
	@echo '  "trg":       "${TRGLANG}",'                      >> $@
	@echo '  "version":   ${VERSION},'                        >> $@
	@echo '  "API":       1.0'                                >> $@
	@echo '}'                                                 >> $@

${MODEL_DIR}/config.intgemm8bitalpha.yml: 	${MODEL_DIR}/model.intgemm8.bin \
						${MODEL_DIR}/vocab.src.spm \
						${MODEL_DIR}/vocab.trg.spm
	@echo 'relative-paths: true' 	> $@
	@echo 'models:' 		>> $@
	@echo '  - model.intgemm8.bin' 	>> $@
	@echo 'vocabs:' 		>> $@
	@echo '  - vocab.src.spm' 	>> $@
	@echo '  - vocab.trg.spm' 	>> $@
ifneq (${MODEL_SHORTLIST},)
	@cp ${MODEL_SHORTLIST} ${MODEL_DIR}/lex.s2t.bin
	@echo 'shortlist:' 		>> $@
	@echo '    - lex.s2t.bin' 	>> $@
	@echo '    - false' 		>> $@
endif
	@echo 'beam-size: 1' 		>> $@
	@echo 'normalize: 1.0' 		>> $@
	@echo 'word-penalty: 0' 	>> $@
	@echo 'mini-batch: 64' 		>> $@
	@echo 'maxi-batch: 1000' 	>> $@
	@echo 'maxi-batch-sort: src' 	>> $@
	@echo 'workspace: 2000' 	>> $@
	@echo 'max-length-factor: 2.0' 	>> $@
	@echo 'skip-cost: true' 	>> $@
	@echo 'gemm-precision: int8shift' >> $@





model-index.txt:
	wget -O $@ ${MODEL_INDEX}



# OLD

# app/models/${MODEL_NAME}.tar.gz: app/models/${MODEL_NAME}/model.intgemm8.bin
# 	cd app/models && tar -czf ${notdir $@} ${MODEL_NAME}

# app/models/${MODEL_NAME}/model.intgemm8.bin: ${MODEL_ORIGINAL}
# 	mkdir -p ${dir $@}
# 	../3rd_party/marian-dev/build/marian-conv -g intgemm8 -f $< -t $@
