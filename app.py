from flask import Flask, request #import main Flask class and request object

app = Flask(__name__) #create the Flask app

@app.route('/query-example')
def query_example():
    language = request.args.get('lang') #if key doesn't exist, returns None
    a = request.args.get('a')
    return '''<h1>The language value is: {} </h1>'''.format(language)

@app.route('/form-example')
def formexample():
    a = {"Name": "Rahul", "Role": "Developer"}
    return a.Name
@app.route('/readafile')
def readfilepython():
    f = open("sample.txt","r")
    contents = f.read()
    return contents
@app.route('/json-example')
def jsonexample():
    return 'Todo...'

if __name__ == '__main__':
    app.run()