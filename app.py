from flask import Flask, render_template, jsonify

app = Flask(__name__)
counter = 0

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/increment', methods=['POST'])
def increment():
    global counter
    counter += 1
    return jsonify(counter=counter)

if __name__ == '__main__':
    app.run(debug=True, port=50000)  # Change 8000 to your desired port

