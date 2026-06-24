#
# create model packages and update the catalog
#

SHELL := bash
DATE  := ${shell date +%F}

## add all models to RELEASED_MODELS that you want to include

STORAGE_URL      = https://object.pouta.csc.fi
MODEL_CONTAINER  = Tatoeba-MT-models
OPUSMT_CONTAINER = OPUS-MT-models
MODEL_INDEX      = ${STORAGE_URL}/${MODEL_CONTAINER}/index.txt


RELEASED_MODELS = ukr-eng/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip \
		ukr-fra/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip \
		ukr-spa/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip \
		ces+slk-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-23.zip \
		deu-ukr/opusTCv20210807+nopar+ftmono+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip \
		eng-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip \
		gmq-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-23.zip \
		spa-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip


# done:

# 	eng-fin/opusTCv20210807+nopar+ft95-jointvoc_transformer-tiny11-align_2022-01-27.zip
#	eng-fin/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-01-25.zip
#	swe-fin/opusTCv20210807+nopar+ft95-2022-01-19.zip \

#	ukr-bul/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-dan/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip \
#	ukr-deu/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-eng/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-05.zip
#	ukr-fin/opusTCv20210807+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-hun/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-lit/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip
#	ukr-nob/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip \
# 	ukr-pol/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip
#	ukr-ron/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-swe/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ukr-tur/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip \

#	deu-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-20.zip \
#	eng-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-05.zip
# 	fra-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-20.zip
#	fin-ukr/opusTCv20210807+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	hun-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# 	lit-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip \
#	pol-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	ron-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip \
#	swe-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip


# currently best ukr models:

# ukr-bul/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# ukr-dan/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip
# ukr-deu/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# ukr-eng/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip
# ukr-fin/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip
# ukr-fra/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip
# ukr-hun/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip
# ukr-lit/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip
# ukr-nob/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip
# ukr-pol/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip
# ukr-ron/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# ukr-spa/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip
# ukr-swe/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip
# ukr-tur/opusTCv20210807+pft-sepvoc_transformer-tiny11-align_2022-03-13.zip

# ces+slk-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-23.zip
# deu-ukr/opusTCv20210807+nopar+ftmono+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip
# eng-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-23.zip
# fin-ukr/opusTCv20210807+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# fra-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-20.zip
# gmq-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-23.zip
# hun-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# lit-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-17.zip
# ron-ukr/opusTCv20210807+bt+pbt+pft-sepvoc_transformer-tiny11-align_2022-03-16.zip
# spa-ukr/opusTCv20210807+nopar+ft95-sepvoc_transformer-tiny11-align_2022-03-21.zip






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
RELEASE_DATE := ${shell echo '${basename ${MODEL}}' | tr '_' '-' | rev | cut -f1-3 -d\- | rev}
VERSION      := ${shell echo '${basename ${MODEL}}' | tr '_' '-' | rev | cut -f2-3 -d\- | rev | tr '-' '.'}

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

## upload models and the catalog
## NOTE: this only works on CSC with allas tools
.PHONY: upload
upload:
	( module load allas; \
	  source /appl/opt/allas/env/allas_conf -s; \
	  swift upload ${OPUSMT_CONTAINER} app/models/*.tar.gz; \
	  swift copy --destination /${OPUSMT_CONTAINER}/app/models_${DATE}.json ${OPUSMT_CONTAINER} app/models.json; \
	  swift upload ${OPUSMT_CONTAINER} app/models.json )

upload-catalog:
	swift upload ${OPUSMT_CONTAINER} app/models.json

${MODEL_DIST}:
	${MAKE} model
	cd ${dir $@} && tar -czf ${notdir $@} ${notdir $(@:.tar.gz=)}
	${MAKE} update
	${MAKE} cleanup

${CATALOG}: ${MODEL_DIST}
	-if [ ! -e $@ ]; then \
	  mkdir -p ${dir $@}; \
	  wget -O ${CATALOG} ${MODEL_BASE_URL}/models.json; \
	fi
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
	@echo '{'                                                   > $@
	@echo '  "modelName":  "${LANGPAIR} ${MODELINFO_TYPE}",'    >> $@
	@echo '  "shortName":  "${LANGPAIRID}-${MODELINFO_TYPE}",'  >> $@
	@echo '  "type":       "${MODEL_TYPE}",'                    >> $@
	@echo '  "src":        "${SRCLANG}",'                       >> $@
	@echo '  "trg":        "${TRGLANG}",'                       >> $@
	@echo '  "srcTags": {'                                      >> $@
	@echo '      "${SRC}": "${SRCLANG}"'                        >> $@
	@echo '  },'                                                >> $@
	@echo '  "trgTag":     "${TRG}",'                           >> $@
#	@echo '  "repository": "OPUS-MT",'                          >> $@
	@echo '  "version":    ${VERSION},'                         >> $@
	@echo '  "API":        1.0'                                 >> $@
	@echo '}'                                                   >> $@

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
	@echo 'gemm-precision: int8'    >> $@
#	@echo 'gemm-precision: int8shift' >> $@





model-index.txt:
	wget -O $@ ${MODEL_INDEX}



# OLD

# app/models/${MODEL_NAME}.tar.gz: app/models/${MODEL_NAME}/model.intgemm8.bin
# 	cd app/models && tar -czf ${notdir $@} ${MODEL_NAME}

# app/models/${MODEL_NAME}/model.intgemm8.bin: ${MODEL_ORIGINAL}
# 	mkdir -p ${dir $@}
# 	../3rd_party/marian-dev/build/marian-conv -g intgemm8 -f $< -t $@
