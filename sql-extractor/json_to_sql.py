import json
# open json file to extract recent script
with open("dbscript-json/ratings.json", "r") as input:
    data = json.load(input)

jsonArray = data['query']
for jsonValue in jsonArray:
    if jsonValue['version'] == "latest":
        query_string = jsonValue['query_text']
print(query_string)

with open("ddl-script.sql", "w") as output:
    output.write(query_string)
