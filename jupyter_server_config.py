c.ServerProxy.servers = {
    'eagler-proxy': {
        'command': ['java', '-jar', 'proxy.jar'], # Replace with your specific proxy executable jar
        'port': 8080,
        'timeout': 60,
        'launcher_entry': {
            'title': 'Eagler Proxy',
        }
    }
}
