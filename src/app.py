from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://admin:password@db:3306/test'
db = SQLAlchemy(app)


@app.route("/")
def hello():
    return "HELLO WORLD!"


@app.route("/schemas")
def lol():
    return str([i[0] for i in db.session.execute("Show Schemas;").fetchall()])


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
