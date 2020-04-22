from glob import glob
import sys
import re
import os

project_id = input("Please enter your project id and hit enter: ")

bucket = "gs://" + project_id +"-state"
print(f"Attempting to create a bucket, {bucket} for Terraform state...")

os.system(f"gsutil mb -b on -p {project_id} {bucket}")

for f in glob("./**/*.tf"):
  with open(f, "r") as fh:
    data = fh.read()
  with open(f, "w") as fh:
    print("Updating file: " + f)
    fh.write(re.sub(r"PROJECT_PLACEHOLDER", project_id, data))