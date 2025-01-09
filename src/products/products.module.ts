import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { ProductService } from "./products.service";
import { ProductController } from "./products.controller";
import { Product } from "./entities/product.entity";
import { MqttModule } from "../mqtt/mqtt.module";

@Module({
  imports: [SequelizeModule.forFeature([Product]), MqttModule],
  controllers: [ProductController],
  providers: [ProductService],
})
export class ProductModule {}
