#include <iostream>
#include <memory>
#include <string>

#include "absl/flags/flag.h"
#include "absl/flags/parse.h"

#include <grpcpp/grpcpp.h>

#include "hellosvr.grpc.pb.h"

ABSL_FLAG(std::string, target, "192.168.122.1:30000", "Server address");

using grpc::Channel;
using grpc::ClientContext;
using grpc::Status;

class HelloSvrClient {
 public:
  HelloSvrClient(std::shared_ptr<Channel> channel)
      : stub_(HelloSvr::HelloSvr::NewStub(channel)) {}

  // Assembles the client's payload, sends it and presents the response back
  // from the server.
  std::string SayHello(const std::string& user) {
    // Data we are sending to the server.
    HelloSvr::SayHelloReq request;
    request.set_name(user);

    // Container for the data we expect from the server.
    HelloSvr::SayHelloResp reply;

    // Context for the client. It could be used to convey extra information to
    // the server and/or tweak certain RPC behaviors.
    ClientContext context;

    // The actual RPC.
    Status status = stub_->SayHello(&context, request, &reply);

    // Act upon its status.
    if (status.ok()) {
      return reply.message();
    } else {
      std::cout << status.error_code() << ": " << status.error_message()
                << std::endl;
      return "RPC failed";
    }
  }

 private:
  std::unique_ptr<HelloSvr::HelloSvr::Stub> stub_;
};

int main(int argc, char** argv) {
  absl::ParseCommandLine(argc, argv);
  // Instantiate the client. It requires a channel, out of which the actual RPCs
  // are created. This channel models a connection to an endpoint specified by
  // the argument "--target=" which is the only expected argument.
  std::string target_str = absl::GetFlag(FLAGS_target);
  // We indicate that the channel isn't authenticated (use of
  // InsecureChannelCredentials()).
  HelloSvrClient hello(
      grpc::CreateChannel(target_str, grpc::InsecureChannelCredentials()));
  std::string user("world");
  std::string reply = hello.SayHello(user);
  std::cout << "Hello received: " << reply << std::endl;

  return 0;
}