import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'


def retrieve_events(url):
    """Retrieve events from GitHub API"""
    response = requests.get(url).text
    return json.loads(response)

def print_events(events, n=5):
    """Print events to console"""
    for event in events[:n]:
        event = event['type'] + ' :: ' + event['repo']['name']
        print(event)

def main():
    print(url)
    events = retrieve_events(url)
    print_events(events)

if __name__ == '__main__':
    main()