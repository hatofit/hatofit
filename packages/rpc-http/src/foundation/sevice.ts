import { createConsola, type ConsolaInstance } from 'consola'
import type { Context } from './context'

export class BaseService {
  name: string = 'BaseService'
  log: ConsolaInstance
  
  constructor(public context: Context) {
    const log = createConsola({
      fancy: true,
      formatOptions: {
        date: true,
      },
      level: 99,
    })
    this.log = log
  }

  async setup() {}

  async start() {}
}

export class ServiceManager {
  constructedServices: BaseService[] = []

  constructor(private context: Context, private services: typeof BaseService[]) {
    context.set('serviceManager', this)
  }

  async setup() {
    for (const service of this.services) {
      const instance = new service(this.context)
      this.constructedServices.push(instance)
    }

    for (const service of this.constructedServices) {
      await service.setup()
    }
  }

  async start() {
    for (const service of this.constructedServices) {
      await service.start()
    }
  }

  getService(name: string) {
    return this.constructedServices.find(service => service.name === name)
  }
}