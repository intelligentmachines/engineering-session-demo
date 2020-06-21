from flask import Flask, jsonify
import os
app = Flask(__name__)

app_name = os.environ['APP_NAME']
@app.route('/')
def hello_world():
    return jsonify(
        dict(
            message='Hello World',
            app_name=app_name
        )
    )


# something changed
if __name__ == '__main__':
    app.run(host='0.0.0.0')