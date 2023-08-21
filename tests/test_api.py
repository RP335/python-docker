# testing the response data not response code
import requests
import json
import api

class TestAPI:
    def test_get(self):
        
        response = api.get()
        assert response.status_code == 200
        response_body = response.json()
        assert response_body[0]['userId'] == 1
        assert response_body[0]['id'] == 1
        assert response_body[0]['title'] == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
        assert response_body[0]['body'] == 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit ' \
                                            'molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'

    def test_create_post(self):
        # Arrange
        data = '{"title": "foo", "body": "bar", "userId": "1"}'

        # Act
        response = api.post(data)

        # Assert
        assert response.status_code == 201
        response_body = response.json()
        assert response_body['title'] == 'foo'
        assert response_body['body'] == 'bar'
        assert response_body['userId'] == '1'
        assert response_body['id'] == 100

    def test_put(self):
        data = '{"id": 1, "title": "foo", "body": "bar", "userId": "1"}'

        response = api.put(1,data)

        assert response.status_code == 200
        response_body = response.json()
        assert response_body['title'] == 'foo'
        assert response_body['body'] == 'bar'
        assert response_body['userId'] == '1'
        assert response_body['id'] == 1

    def test_patch(self):
        
        data = '{"title": "foo patch"}'

        response = api.patch(1,data)

        assert response.status_code == 200

        response_body = response.json()

        assert response_body['title'] == 'foo patch'
        assert response_body['body'] == 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit ' \
                                            'molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto'
        assert response_body['userId'] == 1
        assert response_body['id'] == 1

    def test_delete(self):
        response = api.delete(1)
        assert response.status_code == 200









