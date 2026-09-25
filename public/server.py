import http.server
import json
import urllib.parse

class ApiHandler (http.server.BaseHTTPRequestHandler):
    def send_json (self,status_code, payload):
        body = json.dumps (payload).encode('utf8')
        self.send_response(status_code)
        self.send_header('Content - Type', 'aplication/json')
        self.send_header('Content - Lengh', str(len(body)))
        self.end_headers()
        self.wfile.srtite(body)

    def do_GET (self):
        path = urllib.parse.urlparse(self.path).path
        if path == '/healthcheck':
            self.send_json(200,{
                'succes':True
                'data':{'language':'python'},})

        else:
            self.send_json(404,{

            })