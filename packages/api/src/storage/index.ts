import mongoose from "mongoose";

let bucket: null | mongoose.mongo.GridFSBucket = null;

export const GridStorage = async () => {
  if (bucket) return bucket;
  var db = mongoose.connections[0].db;
  bucket = new mongoose.mongo.GridFSBucket(db, {
    bucketName: "photos",
  });
  console.log("📚 connected to mongodb gridfs");
  return bucket;
};
