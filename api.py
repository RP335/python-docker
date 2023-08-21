import requests

baseurl = 'https://jsonplaceholder.typicode.com/'

def get():
    url = f"{baseurl}posts"
    headers = {'accept': 'application/json'}
    return requests.get(url,headers=headers)

def post(data):
    url = f"{baseurl}posts"
    headers = {'accept': 'application/json', 'Content-Type': 'application/json'}
    return requests.post(url,headers=headers,data=data)

def put(post_id,data):
    url = f"{baseurl}posts/{post_id}"
    headers = {'accept': 'application/json', 'Content-Type': 'application/json'}
    return requests.put(url,headers=headers,data=data)

def patch(post_id,data):
    url = f"{baseurl}posts/{post_id}"
    headers = {'accept': 'application/json', 'Content-Type': 'application/json'}
    return requests.patch(url,headers=headers,data=data)

def delete(post_id):
    url = f"{baseurl}posts/{post_id}"
    headers = {'accept': 'application/json'}
    return requests.delete(url,headers=headers)