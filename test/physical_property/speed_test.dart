// ignore_for_file: non_constant_identifier_names

import 'package:qty/speed.dart';
import 'package:qty/volume.dart';
import 'package:test/test.dart';

void main() {
  test('Speed singleton', () {
    final anUnitKind = Speed();
    final sameUnitKind = Speed();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Speed units', () {
    final speed = Speed();
    final none = speed.unitWith(symbol: 'unknown');
    final m_s = speed.unitWith(symbol: 'm/s')!;
    final km_h = speed.unitWith(symbol: 'km/h')!;
    final cm_s = speed.unitWith(symbol: 'cm/s')!;
    final mi_h = speed.unitWith(symbol: 'mi/h')!;
    final kt = speed.unitWith(symbol: 'nm/h')!;
    expect(none, isNull);
    expect(m_s.symbol, 'm/s');
    expect(km_h.name, 'kilometers per hour');
    expect(cm_s.symbol, 'cm/s');
    expect(mi_h.name, 'miles per hour');
    expect(kt.symbol, 'nm/h');
    expect(m_s, same(Speed.m_s));
    expect(km_h, same(Speed.km_h));
    expect(cm_s, same(Speed.cm_s));
    expect(mi_h, same(Speed.mi_h));
    expect(kt, same(Speed.kt));
  });

  test('Speed convertion factors', () {
    expect(Speed.m_s.quantityConverterTo(Speed.km_h)(1.0), 3.6);
    expect(Speed.km_h.quantityConverterTo(Speed.m_s)(1.0),
        inInclusiveRange(0.277777777, 0.27777778));
    expect(Speed.m_s.quantityConverterTo(Speed.cm_s)(1.0), 100.0);
    expect(Speed.mi_h.quantityConverterTo(Speed.km_h)(1.0), 1.609344);
    expect(Speed.km_h.quantityConverterTo(Speed.mi_h)(1.0),
        inInclusiveRange(0.621371192, 0.621371193));
    expect(Speed.m_s.quantityConverterTo(Speed.kt)(1.0),
        inInclusiveRange(1.943844492, 1.943844493));
    expect(Speed.kt.quantityConverterTo(Speed.m_s)(1.0),
        inInclusiveRange(0.514444444, 0.514444445));
  });
}