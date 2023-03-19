from ultralytics import YOLO
import json
import numpy as np
import json

def getPredict(img):
    model = YOLO("best.pt")
    results = model.predict(img, imgsz=288) 

    predictions = []

    for r in results:
        for c in r.boxes.cls:
            predictions.append(model.names[int(c)])

    predictions = sorted(predictions)
    counts = {}

    for number in predictions:
        if number in counts:
            counts[number] += 1
        else:
            counts[number] = 1

    json_obj = json.dumps(counts)
    return json_obj