# ommand on the newly opened terminal
mongosh -u root -p PASSWORD --authenticationDatabase admin local

# Select the training database.
use training

# Create a collection named languages.
db.createCollection("languages")

# Create documents
db.languages.insertOne({"name":"java","type":"object oriented"})
db.languages.insertOne({"name":"python","type":"general purpose","versions":201})

# To insert more than one document at the same time, you can use insertMany command; which accepts an array as the argument.
db.languages.insertMany([
    {"name":"scala","type":"functional"},
    {"name":"c","type":"procedural"},
    {"name":"c++","type":"object oriented"}
])

# Find how many documents in languages collection.
db.languages.countDocuments()

# List the first document in the collection.
db.languages.findOne()

# List all documents in the collection.
db.languages.find()

# List first 3 documents in the collection.
db.languages.find().limit(3)

# Query for "python" language.
db.languages.find({"name":"python"})

# Query for "object oriented" languages.
db.languages.find({"type":"object oriented"})

# Use projection to only project specific fields. Using a projection document you can specify what fields 
# we wish to see or skip in the output.
# This command lists all the documents with only name field in the outpu.
db.languages.find({},{"name":1})

# This command lists all the documents without the name field in the output.
db.languages.find({},{"name":0})

# This command lists all the object oriented languages with only name field in the output.
db.languages.find({"type":"object oriented"},{"name":1})

#  Update documents:
# The updateMany command is used to update documents in a mongodb collection, and it has the following generic syntax.
db.collection.updateMany(<filter>,<update>)

# Here we are adding a field description with value programming language to all documents.
db.languages.updateMany({},{$set:{"description":"programming language"}})

# Set the creater for python language.
db.languages.updateMany({"name":"python"},{$set:{"creator":"Guido van Rossum"}})

# Set a field named compiled with a value true for all the object oriented languages.
db.languages.updateMany({"type":"object oriented"},{$set:{"compiled":true}})

# Increment version for python by 1.
db.languages.updateOne({"name":"python"},{$inc:{"version":1}})

# Delete documents:
# Delete one scala language document.
db.languages.deleteOne({"name":"scala"})

# Delete all object oriented languages.
db.languages.deleteMany({"type":"object oriented"})

# Delete all the documents in a collection.
db.languages.deleteMany({})
