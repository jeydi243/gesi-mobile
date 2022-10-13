import "package:dart_amqp/dart_amqp.dart";

void MicroInit() async {
  ConnectionSettings settings = ConnectionSettings(
      host: "localhost",
      virtualHost: "/",
      port: 55916,
      authProvider: PlainAuthenticator("gesi", "gesi"));
  Client client = Client(settings: settings);

  Channel channel = await client.channel();
  Queue queue = await channel.queue("hello", durable: true);
  Consumer consumer = await queue.consume();
  consumer.listen((AmqpMessage message) {
    print(" [x] Received string: ${message.payloadAsString}");
    print(" [x] Received json: ${message.payloadAsJson}");
    print(" [x] Received raw: ${message.payload}");

    message.reply("world");
  });
}
