import { Injectable, OnModuleInit, OnModuleDestroy } from "@nestjs/common";
import { connect, MqttClient } from "mqtt";

@Injectable()
export class MqttService implements OnModuleInit, OnModuleDestroy {
  private client: MqttClient;

  onModuleInit() {
    this.client = connect("mqtt://localhost:1883");

    this.client.on("connect", () => {
      console.log("Connected to MQTT broker");
    });

    this.client.on("error", (err) => {
      console.error("MQTT connection error:", err);
    });

    this.client.subscribe("Operational", (err) => {
      if (err) console.error("Subscription error:", err);
    });

    this.client.on("message", (topic, message) => {
      console.log(
        `Received message on topic "${topic}": ${message.toString()}`
      );
    });
  }

  publish(topic: string, message: any) {
    this.client.publish(topic, JSON.stringify(message));
  }

  onModuleDestroy() {
    if (this.client) {
      this.client.end();
    }
  }
}
