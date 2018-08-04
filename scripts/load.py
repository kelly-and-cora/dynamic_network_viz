#!/usr/bin/env python
import json
timeframes = ["time1_json.json", "time2_json.json", "time3_json.json", "time4_json.json"]
input_folder = 'data/'
output_folder = 'dist/'
with open(input_folder + 'gender.json', "r") as read_file:
    gender_data = json.load(read_file)

for timeframe in timeframes:
    with open(input_folder + timeframe, "r") as read_file:
        time_data = json.load(read_file)
    print(time_data[0])
    new_data = {}
    new_data['nodes'] = gender_data
    new_data['links'] = time_data

    with open(output_folder + timeframe, 'w') as outfile:
        json.dump(new_data, outfile)
