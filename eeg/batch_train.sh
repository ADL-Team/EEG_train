#!/bin/bash

gpu=$1
data=$2
start=0
end=`cat ./eeg/config.json | jq '.data_loader.args.num_folds'`
end=$((end-1))
for i in $(eval echo {$start..$end})
do
   python ./eeg/main.py --fold_id=$i --device $gpu --np_data_dir $data
done

exec "$@"
