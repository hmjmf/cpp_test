#include <iostream>
#include "test.pb.h"

int main(){
  PackName::Test msg;
  msg.set_msg("fuck");
  std::cerr << msg.DebugString() << std::endl;
  return 0;
}