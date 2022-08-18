import "package:dart_amqp/dart_amqp.dart";

void MicroInit() async {
  ConnectionSettings settings = ConnectionSettings(host: "localhost", authProvider: PlainAuthenticator("guest", "guest"));
  Client client = Client(settings: settings);

  Channel channel = await client.channel();
  Queue queue = await channel.queue("test_q", durable: true);
  Consumer consumer = await queue.consume();
  consumer.listen((AmqpMessage message) {
    // Get the payload as a string
    print(" [x] Received string: ${message.payloadAsString}");

    // Or unserialize to json
    print(" [x] Received json: ${message.payloadAsJson}");

    // Or just get the raw data as a Uint8List
    print(" [x] Received raw: ${message.payload}");

    // The message object contains helper methods for
    // replying, ack-ing and rejecting
    message.reply("world");
  });
}
