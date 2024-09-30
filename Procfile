web: tensorflow_model_server --port=8500 --rest_api_port=${PORT:-8501} \
    --model_name=${MODEL_NAME} \
    --model_base_path=${MODEL_BASE_PATH:-/models}/${MODEL_NAME} \
    --monitoring_config_file=${MONITORING_CONFIG} \
    "$@"
