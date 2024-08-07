class SavedServer {
  final int id;
  final String hostname;
  final int serverPort;
  final int streamingPort;
  final String? homeHostname;
  final List<String>? homeNetworks;

  SavedServer({required this.id, required this.hostname, this.homeHostname, this.homeNetworks, required this.serverPort, required this.streamingPort});
}