from flask import Flask # Import Flask Class
app = Flask(__name__) # Create an Instance

@app.route('/') # Route the Function
def main(): # Run the function
	return 'Hello World'

app.run(host='0.0.0.0', port=5000, debug=True)