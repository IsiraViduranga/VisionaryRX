from ultralytics import YOLO
import json
import numpy as np
import json

# Define function to get predictions
def getPredict(img):
    # Load YOLO model with weights
    model = YOLO("best.pt")
    # Get predictions from the model for the given image
    results = model.predict(img, imgsz=288) 

    predictions = []

    # Extract the class names for each prediction
    for r in results:
        for c in r.boxes.cls:
            predictions.append(model.names[int(c)])

    # Sort the predictions in alphabetical order
    predictions = sorted(predictions)

    counts = {}

    # Count the number of occurrences of each class in the predictions
    for number in predictions:
        if number in counts:
            counts[number] += 1
        else:
            counts[number] = 1

    # Convert the counts dictionary to a JSON object and return it
    json_obj = json.dumps(counts)
    return json_obj