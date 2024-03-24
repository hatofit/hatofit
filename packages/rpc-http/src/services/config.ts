import type { Context } from "@/foundation/context";
import context from "@/foundation/context";
import { BaseService, ServiceManager } from "@/foundation/sevice";
import dotenv from 'dotenv'
import path from 'path'
import fs from 'fs'

export class ConfigService extends BaseService {
  name = 'Config'

  async setup() {
    this.log.info(`Setting up ${this.name}`)

    // dotenv
    // load DIRNAME . '../../.env' , '../../../../.env',
    const envPaths = [
      path.join(__dirname, '../../.env'),
      path.join(__dirname, '../../../../.env'),
    ]
    for (const envPath of envPaths) {
      if (fs.existsSync(envPath)) {
        this.log.info(`Loading .env file from ${envPath}`)
        dotenv.config({ path: envPath })
      }
    }

    this.context.set('config', {
      ...process.env,
    })
  }

  async start() {}


  getAll() {
    return this.context.get('config') as { [key: string]: string|undefined }
  }

  get(key: string) {
    const config = this.getAll()
    return config[key] as string|undefined
  }
}

export const getConfigService = (ctx?: Context) => {
  return (ctx || context).get<ServiceManager>('serviceManager').getService('Config') as ConfigService
}