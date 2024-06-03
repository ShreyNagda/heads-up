import random
from flask import Flask, json, jsonify,request

app = Flask(__name__)

@app.route("/")
def home():
    print("Server running successfully!")
    return jsonify("Server running successfully!")

#Random Words
@app.route("/words", methods=["GET"])
def getWords():
    n = int(request.args["n"]) or 5
    with open('objects.txt', "r", encoding='utf-8') as file:
        words_list = [line.strip() for line in file]
    random_words = random.sample(words_list, n)
    return jsonify(random_words)

#Random Movies
@app.route("/movies",methods=['GET'])
def getMovies():
    n = int(request.args["n"]) or 5
    with open("movies.txt", "r", encoding="utf-8") as file:
        movies_list = [line.strip() for line in file]
    random_movies = random.sample(movies_list, n)
    return jsonify(random_movies)

@app.route("/cricketers")
def getCricketers():
    n = int(request.args["n"]) or 5
    with open('cricketers.txt', "r", encoding='utf-8') as file:
        cricketersList = [line.strip() for line in file]
    random_cricketers = random.sample(cricketersList, n)
    return jsonify(random_cricketers)

if (__name__ == "__main__"):
    app.run()