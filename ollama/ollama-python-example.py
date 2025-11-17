import os
import sys
from ollama import chat

response = chat(model='llama3', messages=[
    {'role': 'user', 'content': 'What is geometry?'}
])

print(response['message']['content'])
