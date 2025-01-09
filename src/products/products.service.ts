import {
  Injectable,
  NotFoundException,
  InternalServerErrorException,
  ConflictException,
} from "@nestjs/common";
import { InjectModel } from "@nestjs/sequelize";
import { Product } from "./entities/product.entity";
import { CreateProductDto } from "./dto/create-product.dto";
import { UpdateProductDto } from "./dto/update-product.dto";
import { MqttService } from "../mqtt/mqtt.service";

@Injectable()
export class ProductService {
  constructor(
    @InjectModel(Product) private readonly productModel: typeof Product,
    private readonly mqttService: MqttService
  ) {}

  async create(createProductDto: CreateProductDto): Promise<Product> {
    try {
      const existingProduct = await this.productModel.findOne({
        where: { name: createProductDto.name },
      });
      if (existingProduct) {
        throw new ConflictException("Product name already exist.");
      }
      const product = await this.productModel.create(createProductDto);

      await this.mqttService.publish("Operational", {
        id: product.id,
        name: product.name,
      });

      return product;
    } catch (error) {
      throw new InternalServerErrorException("Failed to create product");
    }
  }

  async findAll(): Promise<Product[]> {
    try {
      return await this.productModel.findAll();
    } catch (error) {
      throw new InternalServerErrorException("Failed to retrieve products");
    }
  }

  async findOne(id: number): Promise<Product> {
    try {
      const product = await this.productModel.findByPk(id);
      if (!product) {
        throw new NotFoundException(`Product with ID ${id} not found`);
      }
      return product;
    } catch (error) {
      throw new InternalServerErrorException("Failed to retrieve products");
    }
  }

  async update(
    id: number,
    updateProductDto: UpdateProductDto
  ): Promise<Product> {
    try {
      const product = await this.productModel.findByPk(id);
      if (!product) {
        throw new NotFoundException(`Product with ID ${id} not found`);
      }
      await product.update(updateProductDto);
      return product;
    } catch (error) {
      throw new InternalServerErrorException("Failed to update product");
    }
  }

  async remove(id: number): Promise<void> {
    try {
      const product = await this.productModel.findByPk(id);
      if (!product) {
        throw new NotFoundException(`Product with ID ${id} not found`);
      }
      await product.destroy();
    } catch (error) {
      throw new InternalServerErrorException("Failed to delete product");
    }
  }
}