// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // 定义查找器，
    final counterTextFinder = find.byValueKey('counterText');
    final buttonFinder = find.byTooltip('Increment');
    final buttonAdd = find.byValueKey("add");
    final buttonSubtract = find.byValueKey("subtract");
    final alertText = find.byValueKey("alert_text");
    final btnClose = find.byValueKey("close_button");

    FlutterDriver driver;

    // 每个测试之前都要连接到Flutter driver
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // 每个测试结束后关闭driver
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  test('Increment the counter', () async {
      // 第一步按按钮
      await driver.tap(buttonFinder);

      // 计数器已增加1 断言
      expect(await driver.getText(counterTextFinder), "1");

      // 按按钮
      await driver.tap(buttonFinder);

      // 计数器增加到2 断言
      expect(await driver.getText(counterTextFinder), "2");

      await driver.tap(buttonFinder);
      expect(await driver.getText(counterTextFinder), "3");
      await driver.tap(buttonFinder);
      expect(await driver.getText(counterTextFinder), "4");
      await driver.tap(buttonFinder);

  });


    test("Test with alert window", () async {
      await driver.tap(buttonAdd);

      expect(await driver.getText(alertText), "Welcome to ExecuteAutomation 2");

      // 点击关闭弹框
      await driver.tap(btnClose);

      //点击减号
      await driver.tap(buttonSubtract);

      //验证
      expect(await driver.getText(counterTextFinder), "4");
    });
    
  });
}