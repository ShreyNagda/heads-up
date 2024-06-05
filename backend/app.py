import random
from flask import Flask, json, jsonify,request


def create_app():
    flask_app = Flask(__name__)
    from routes import main_bp
    flask_app.register_blueprint(main_bp)
    return flask_app



if (__name__ == "__main__"):
    app = create_app()
    app.run(debug=True)