#!/usr/bin/python3
import pymongo
import sys
import json


clientURI = "mongodb+srv://"

try:
        client=pymongo.MongoClient(clientURI,
                                username='',
                                password='',
                                authSource='admin',
                                tls='true',
                                tlsCAFile='',
                                authMechanism='PLAIN')

        listdbs=client.list_database_names()
        exclude=['admin', 'config', 'local']
        listdbs=[db for db in listdbs if db not in exclude]

        for db in listdbs:

                database = client[db]
                dbstatus = database.command('dbstats')

                datasize = int(dbstatus['dataSize'])
                indexsize = int(dbstatus['indexSize'])
                nbcoll = int(dbstatus['collections'])

                print(db + '\tDatabase Size:' + str(datasize) + ' B\tIndex Size:' + str(indexsize) + ' B\t Total Collections:' + str(nbcoll))

                for coll in database.list_collection_names():

                        collstatus = database.command('collstats', coll)

                        ns = collstatus['ns']
                        collsize = int(collstatus['size'])
                        indextotsize = int(collstatus['totalIndexSize'])
                        nbdoc = int(collstatus['count'])

                        print(ns + '\tCollection Size:' + str(collsize) + ' B\tIndex Total Size:' + str(indextotsize) + ' B\t Total Documents:' + str(nbdoc))

except pymongo.errors.ConnectionFailure as e:
        print ("Could not connect to MongoDB: " + str(e))
