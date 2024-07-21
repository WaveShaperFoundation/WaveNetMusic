import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

import 'generated/wavenet.pbgrpc.dart';

class WaveClient {

  late ClientChannel channel;
  late LibraryClient libraryClient;

  WaveClient(){
      if(kDebugMode){
        print("Creating WaveClient");
      }
      try{
        this.channel = ClientChannel(
            '192.168.0.50',
            port:50051,
            options: const ChannelOptions(
              userAgent: "Windoof",
              credentials: ChannelCredentials.insecure(),
            )
        );
        this.libraryClient = LibraryClient(channel);
      }catch(e){
        print("Error creating WaveClient: $e");
      }
  }

}