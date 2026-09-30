import http.server
import json
import urllib.parse

class ApiHandler(http.server.BaseHTTPRequestHandler):
    def send_json(self, status_code, payload):
        body = json.dumps(payload).encode('utf8')
        self.send_response(status_code)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-Length', str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        path = urllib.parse.urlparse(self.path).path

        if path == '/healthcheck':
            self.send_json(200, {
                'success': True,
                'data': {
                    'language': 'python'
                }
            })

        else:
            self.send_json(404, {
                'success': False,
                'data': None,
                'message': 'Ruta no encontrada'
            })


if __name__ == '__main__':
    server = http.server.HTTPServer(('', 5000), ApiHandler)
    print('Servidor en localhost:5000')
    server.serve_forever()