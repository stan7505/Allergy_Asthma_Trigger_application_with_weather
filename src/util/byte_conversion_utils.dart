import 'dart:typed_data';

Uint8List UnmodifiableUint8ListView(Uint8List list) {
  return Uint8List.fromList(list).buffer.asUint8List().asUnmodifiableView();
}