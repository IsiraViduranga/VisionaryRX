import os
import werkzeug
from flask import Flask, request, jsonify
from mlmodel import getPredict

app = Flask(__name__)

# Set allowed file types
ALLOW_FILE_TYPE = {'png','jpg','jpeg'} 

# Define endpoint to receive image uploads via POST request
@app.route('/upload', methods=['POST']) 
def upload():
    if request.method == 'POST':
        imageFile = request.files['image'] 
        filename = werkzeug.utils.secure_filename(imageFile.filename) 
        # Save uploaded file to local directory
        imageFile.save('./upload/' + filename) 

        prediction = getPredict('./upload/' + filename) 
        # Return prediction as response to POST request
        return prediction 

if __name__ == '__main__':
    # Run Flask app in debug mode on port 4000
    app.run(debug=True, port=4000) 
