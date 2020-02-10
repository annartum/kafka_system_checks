source env.sh

seq 1 ${PRODUCER_BENCHMARK_PARALLELISM} | parallel --jobs ${PRODUCER_BENCHMARK_PARALLELISM} --tag --line-buffer ./kafka-single-produce.sh
