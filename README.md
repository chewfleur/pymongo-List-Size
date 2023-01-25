# MongoDB Project

This project utilizes the PyMongo library to connect to a MongoDB database 
and retrieve the size and numbers of databases, collections, documents and indexes.

## Requirements
- MongoDB
- PyMongo

## Installation
1. Install MongoDB by following the instructions on the [official website](https://docs.mongodb.com/manual/installation/)
2. Install PyMongo using pip: `pip install pymongo`

## Usage
1. import the necessary libraries 
2. establish a connection to the MongoDB database by changing for example this parameters in python script

```python
clientURI = 'mongodb://localhost:27017/'
username=''
password=''
...
```

## Additional Resources
[PyMongo documentation](https://pymongo.readthedocs.io/en/stable/)

[MongoDB documentation](https://docs.mongodb.com/)

## Conclusion
This project demonstrates the basic usage of PyMongo to connect to a MongoDB database and perform operations. 
With the power of MongoDB and PyMongo, you can easily work with large amounts of data and perform advanced querying and analytics.
