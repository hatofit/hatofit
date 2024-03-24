import { ServiceManager } from '@/foundation/sevice'

// services
import { PostgresService } from '@/services/postgres'
import { ConfigService } from '@/services/config'
import { MongoService } from '@/services/mongo'
import { HttpService } from '@/services/http'
import { MailService } from '@/services/mail'

// utils
import context from '@/foundation/context'

// run
const service = new ServiceManager(
  context,
  [
    ConfigService,
    PostgresService,
    MongoService,
    MailService,
    HttpService,
  ]
)
await service.setup()
await service.start()