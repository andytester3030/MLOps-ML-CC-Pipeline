FROM tensorflow/serving:latest

COPY ./output/serving_model /models/cc-model
COPY ./config /model_config
ENV MODEL_NAME=cc-model
ENV MODEL_BASE_PATH=/models
ENV MONITORING_CONFIG="/model_config/prometheus.config"
ENV PORT=8501

RUN echo '#!/bin/bash \n\n\
env \n\
tensorflow_model_server --port=8500 --rest_api_port=${PORT:-8501} \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH:-/models}/${MODEL_NAME} \
--monitoring_config_file=${MONITORING_CONFIG} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

CMD ["/usr/bin/tf_serving_entrypoint.sh"]
