import json
import base64
import requests
with open("../dbscript-json/ratings.json", "r") as input:
    data = json.load(input)

jsonArray = data['query']
for jsonValue in jsonArray:
    if jsonValue['version'] == "latest":
        query_string = jsonValue['query_text']
print(query_string)

with open("script.sql", "w") as output:
    output.write(query_string)


githubAPIURL = "https://api.github.com/repos/eminds-guardians/ey-demo/contents/script.sql"
githubToken = "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"

with open("script.sql", "rb") as f:
    # Encoding "my-local-image.jpg" to base64 format
    encodedData = base64.b64encode(f.read())

    headers = {
        "Authorization": f'''Bearer {githubToken}''',
        "Content-type": "application/vnd.github+json"
    }
    data = {
        "message": "uploadsqlfile",  # Put your commit message here.
        "content": encodedData.decode("utf-8")

    }

    r = requests.put(githubAPIURL, headers=headers, json=data)
