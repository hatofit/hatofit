import { ServiceManager } from '@/foundation/sevice'

// services
import { ConfigService } from '@/services/config'
import { HttpService } from '@/services/http'
import { MailService } from '@/services/mail'
import { MongoService } from '@/services/mongo'
import { PostgresService } from '@/services/postgres'

// utils
import context from '@/foundation/context'
import { MinioService } from './services/minio'

// run
const service = new ServiceManager(
  context,
  [
    ConfigService,      // manage config
    PostgresService,    // connecting postgres
    MongoService,       // connecting mongodb
    MinioService,       // storage solution
    MailService,        // send mail
    HttpService,        // handle http server
  ]
)
await service.setup()
await service.start()