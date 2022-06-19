const database = _getEnv("MONGO_INITDB_DATABASE")

db.createUser(
  {
    user: _getEnv("MONGO_INITDB_ROOT_USERNAME"),
    pwd: _getEnv("MONGO_INITDB_ROOT_PASSWORD"),
    roles: [
      {
        role: "readWrite",
        db: database
      }
    ]
  }
);

/// EXAMPLES

// db.createCollection("MYcollection");

// db.sales.insertOne(
//   { "_id" : 1, "item" : "abc", "price" : 10, "quantity" : 2, "date" : new Date("2014-03-01T08:00:00Z")}
// );
