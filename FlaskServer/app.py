import os
import werkzeug
from flask import Flask, request, jsonify
from mlmodel import getPredict

app = Flask(__name__)

ALLOW_FLIE_TYPE = {'png','jpg','jpeg'}

@app.route('/upload', methods = ['POST'])
def upload():
    if (request.method == 'POST'):
        imageFile = request.files['image']
        filename = werkzeug.utils.secure_filename(imageFile.filename)
        imageFile.save("./upload/" + filename)
        prediction = getPredict("./upload/" + filename)

        # return prediction result
        return prediction
    
if __name__ == '__main__':
    app.run(debug=True, port=4000)