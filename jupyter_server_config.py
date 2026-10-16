c.ServerProxy.servers = {
    'eagler-proxy': {
        'command': ['java', '-jar', 'gaius-server-plugin-0.3.3.jar'],
        'port': 8080,
        'timeout': 60,
        'launcher_entry': {
            'title': 'Eaglercraft Server Bridge',
        }
    }
}
