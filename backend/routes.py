from flask import Blueprint,jsonify,request
import random
main_bp = Blueprint("main", __name__)
@main_bp.route("/")
def home():
    print("Server running successfully!")
    return jsonify("Server running successfully!")

#Random Words
@main_bp.route("/words", methods=["GET"])
def getWords():
    if(request.args != None):
        n = int(request.args["n"])
    else:
        n = 5
    with open('objects.txt', "r", encoding='utf-8') as file:
        words_list = [line.strip() for line in file]
    random_words = random.sample(words_list, n)
    return jsonify(random_words)

#Random Movies
@main_bp.route("/movies",methods=['GET'])
def getMovies():
    if(request.args != None):
        n = int(request.args["n"])
    else:
        n = 5
    with open("movies.txt", "r", encoding="utf-8") as file:
        movies_list = [line.strip() for line in file]
    random_movies = random.sample(movies_list, n)
    return jsonify(random_movies)

@main_bp.route("/cricketers")
def getCricketers():
    if(request.args != None):
        n = int(request.args["n"])
    else:
        n = 5
    with open('cricketers.txt', "r", encoding='utf-8') as file:
        cricketersList = [line.strip() for line in file]
    random_cricketers = random.sample(cricketersList, n)
    return jsonify(random_cricketers)