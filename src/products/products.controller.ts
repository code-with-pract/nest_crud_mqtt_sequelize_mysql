import {
  Controller,
  Get,
  Post,
  Body,
  Put,
  Param,
  Delete,
  NotFoundException,
  BadRequestException,
} from "@nestjs/common";
import { ProductService } from "./products.service";
import { CreateProductDto } from "./dto/create-product.dto";
import { UpdateProductDto } from "./dto/update-product.dto";

@Controller("products")
export class ProductController {
  constructor(private readonly productsService: ProductService) {}

  @Post()
  async create(@Body() createProductDto: CreateProductDto) {
    try {
      return await this.productsService.create(createProductDto);
    } catch (error) {
      throw new BadRequestException("Failed to Create Product");
    }
  }

  @Get()
  async findAll() {
    return await this.productsService.findAll();
  }

  @Get(":id")
  async findOne(@Param("id") id: string) {
    const product = await this.productsService.findOne(+id);
    if (!product) {
      throw new NotFoundException(`Product Id not found with ${id}`);
    }
    return product;
  }

  @Put(":id")
  async update(
    @Param("id") id: string,
    @Body() updateProductDto: UpdateProductDto
  ) {
    const updateProduct = await this.productsService.update(
      +id,
      updateProductDto
    );
    if (!updateProduct) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }
    return updateProduct;
  }

  @Delete(":id")
  async remove(@Param("id") id: string) {
    const deleteProduct = await this.productsService.remove(+id);
    return { message: "Product deleted successfully" };
  }
}
