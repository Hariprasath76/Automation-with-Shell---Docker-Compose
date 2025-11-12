from flask import Flask
import redis

app = Flask(__name__)
r = redis.Redis(host='redis', port=6379, db=0)

@app.route('/')
def home():
    # Increment a counter in Redis
    count = r.incr('hits')
    return f"Hello! This page has been visited {count} times."

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
