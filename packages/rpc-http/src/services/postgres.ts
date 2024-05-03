import { DataTypes, Sequelize, type Optional, Model, type InferAttributes, type InferCreationAttributes, type CreationOptional, UUID, UUIDV4 } from 'sequelize'
import { BaseService, ServiceManager } from '@/foundation/sevice'
import { getConfigService } from '@/services/config'

// SCHEMA && TYPES
export class User extends Model<InferAttributes<User>, InferCreationAttributes<User>> {
  declare id: CreationOptional<number>
  declare _id: CreationOptional<string>
  declare email: string
  declare password: string
  declare firstName: string
  declare lastName: string
  declare dateOfBirth: Date
  declare photo?: string
  declare weight: number
  declare height: number
  declare gender: string
  declare metricUnits: {
    energyUnits: string,
    weightUnits: string,
    heightUnits: string,
  }
  
  declare resetPasswordCode?: string
  
  declare requestDelete?: boolean
  declare deleteDate?: Date

  declare requestDeleteCode?: string
  declare requestDeleteDate?: Date
}
export class Company extends Model<InferAttributes<Company>, InferCreationAttributes<Company>> {
  declare id: CreationOptional<number>
  declare name: string
  declare description: string
  declare address: string
}
export class CompanyUser extends Model<InferAttributes<CompanyUser>, InferCreationAttributes<CompanyUser>> {
  declare id: CreationOptional<number>
  declare companyId: number
  declare userId: number
  declare role: 'member' | 'manager' | 'admin'
}

// SERVICE Postgres
export class PostgresService extends BaseService {
  name = 'Postgres'
  sequelize!: Sequelize
  
  async setup() {
    this.log.info(`Connecting to ${this.name}`)
    const config = getConfigService().getAll()
    this.log.debug('load postgres: ', config.DB_HOST, config.DB_PORT, config.DB_USER, config.DB_PASS, config.DB_NAME)

    const sequelize = new Sequelize({
      // dialect: 'sqlite',
      // storage: 'db.sqlite',
      sync: {
        // force: true
      },
      logging: false,
    
      dialect: 'postgres',
      host: config.DB_HOST,
      port: parseInt(config.DB_PORT || '5432'),
      username: `${config.DB_USER}`,
      password: `${config.DB_PASS}`,
      database: `${config.DB_NAME}`,
    })
    this.sequelize = sequelize
    this.loadModels()

    this.context.set('sequelize', sequelize)
    await sequelize.authenticate({})
    await sequelize.sync({
      // force: true
    })
  }

  async start() {
    this.log.info(`${this.name} connected`)
  }

  loadModels() {
    User.init({
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      _id: {
        type: UUID,
        defaultValue: UUIDV4,
        allowNull: false,
        primaryKey: true
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false
      },
      password: {
        type: DataTypes.STRING,
        allowNull: false
      },
      firstName: {
        type: DataTypes.STRING,
        allowNull: false
      },
      lastName: {
        type: DataTypes.STRING,
        allowNull: false
      },
      dateOfBirth: {
        type: DataTypes.DATE,
        allowNull: false
      },
      photo: {
        type: DataTypes.STRING
      },
      weight: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
      height: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
      gender: {
        type: DataTypes.STRING,
        allowNull: false
      },
      metricUnits: {
        type: DataTypes.JSON,
        allowNull: false
      },

      resetPasswordCode: {
        type: DataTypes.STRING
      },
      requestDelete: {
        type: DataTypes.BOOLEAN
      },
      deleteDate: {
        type: DataTypes.DATE
      },
      requestDeleteCode: {
        type: DataTypes.TEXT
      },
      requestDeleteDate: {
        type: DataTypes.DATE
      }
    }, {
      timestamps: true,
      sequelize: this.sequelize,
    })
    Company.init({
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      name: {
        type: DataTypes.STRING,
        allowNull: false
      },
      description: {
        type: DataTypes.STRING,
        allowNull: false
      },
      address: {
        type: DataTypes.STRING,
        allowNull: false
      }
    }, {
      timestamps: true,
      sequelize: this.sequelize,
    })
    CompanyUser.init({
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
      },
      companyId: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
      userId: {
        type: DataTypes.INTEGER,
        allowNull: false
      },
      role: {
        type: DataTypes.STRING,
        allowNull: false
      }
    }, {
      timestamps: true,
      sequelize: this.sequelize,
    })

    // Relations
    CompanyUser.belongsTo(User, { foreignKey: 'userId' })
    CompanyUser.belongsTo(Company, { foreignKey: 'companyId' })
    User.hasMany(CompanyUser, { foreignKey: 'userId' })
    Company.hasMany(CompanyUser, { foreignKey: 'companyId' })

    // hehe
  }
}