import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.layer2).existsSync(), isTrue);
    expect(File(Images.divider).existsSync(), isTrue);
    expect(File(Images.genre).existsSync(), isTrue);
    expect(File(Images.liveTvBlack24dp1).existsSync(), isTrue);
    expect(File(Images.splashPhoto).existsSync(), isTrue);
    expect(File(Images.star).existsSync(), isTrue);
  });
}
