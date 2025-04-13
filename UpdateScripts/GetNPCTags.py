import json
import os
import argparse
from dataclasses import dataclass


with open("DT_NPCData.json", "r") as f:
    jsonFile = json.load(f)  # Parse JSON file

    for dictionary in jsonFile[0]["Rows"]:
        print(jsonFile[0]["Rows"][dictionary]["ID"]["TagName"])