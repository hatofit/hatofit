import type { Context } from "@/foundation/context";
import context from "@/foundation/context";
import { BaseService, ServiceManager } from "@/foundation/sevice";
import nodemailer, { type Transporter } from "nodemailer";
import { getConfigService } from "./config";

export class MailService extends BaseService {
  name = "Mail";
  transporter!: Transporter;

  async setup() {
    const config = getConfigService().getAll();
    this.log.info(`Connecting to ${this.name}`);
    this.log.debug("load mail config: ", config.MAIL_USERNAME);

    const transporter = nodemailer.createTransport({
      service: "gmail",
      host: "smtp.gmail.com",
      port: 587,
      secure: false,
      auth: {
        user: config.MAIL_USERNAME,
        pass: config.MAIL_PASSWORD,
      },
    });
    this.transporter = transporter;
  }

  async start() {}
}

export const getMailService = (ctx?: Context) => {
  return (ctx || context)
    .get<ServiceManager>("serviceManager")
    .getService("Mail") as MailService;
};
