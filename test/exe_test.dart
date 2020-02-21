import 'package:guff/src/webdriver/command.dart';
import 'package:guff/src/webdriver/exe.dart';
import 'package:test/test.dart';


main(){
  test("execute", ()async{
    Command cmd = Command(Commands.NEW_SESSION);
    cmd.setParameter("capabilities", {});
    await Exe.execute(cmd);
  });
}