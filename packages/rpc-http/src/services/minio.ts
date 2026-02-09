import context, { type Context } from "@/foundation/context";
import { BaseService, ServiceManager } from "@/foundation/sevice";
import { Client } from "minio";
import { getConfigService } from "./config";

export class MinioService extends BaseService {
  name = "Minio";
  client!: Client;

  async setup() {
    const BUCKET_LIST = [
      {
        name: "avatars",
        region: "ap-southeast-3",
      },
    ] as const;

    const config = getConfigService().getAll();
    this.log.info(`Connecting to ${this.name}`);
    this.log.debug(
      "load minio: ",
      config.MINIO_ENDPOINT,
      config.MINIO_PORT,
      config.MINIO_USE_SSL,
      config.MINIO_ACCESS_KEY,
      config.MINIO_SECRET_KEY
    );

    const client = new Client({
      endPoint: config.MINIO_ENDPOINT || "localhost",
      port: parseInt(config.MINIO_PORT || "9000"),
      useSSL: config.MINIO_USE_SSL === "true",
      accessKey: config.MINIO_ACCESS_KEY || "minioadmin",
      secretKey: config.MINIO_SECRET_KEY || "minioadmin",
    });

    for (const bucket of BUCKET_LIST) {
      const exists = await client.bucketExists(bucket.name);
      if (!exists) {
        await client.makeBucket(bucket.name, bucket.region);
      }
    }

    this.client = client;
  }

  async start() {
    this.log.info(`${this.name} connected`);
  }

  async createBucket(bucket: string) {
    return this.client.makeBucket(bucket);
  }

  async removeBucket(bucket: string) {
    return this.client.removeBucket(bucket);
  }

  async checkBucket(bucket: string) {
    return this.client.bucketExists(bucket);
  }

  async getPresignedUrl(bucket: string, object: string, expiry?: number) {
    return this.client.presignedGetObject(bucket, object, expiry);
  }

  async uploadFile(
    bucket: string,
    object: string,
    file: string,
    contentType: string
  ) {
    return this.client.fPutObject(bucket, object, file, {
      "Content-Type": contentType,
    });
  }

  async removeFile(bucket: string, object: string) {
    return this.client.removeObject(bucket, object);
  }
}

export const getMinioService = (ctx?: Context) => {
  return (ctx || context)
    .get<ServiceManager>("serviceManager")
    .getService("Minio") as MinioService;
};
