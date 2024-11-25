import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TituloFilmesRecord extends FirestoreRecord {
  TituloFilmesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nome1" field.
  String? _nome1;
  String get nome1 => _nome1 ?? '';
  bool hasNome1() => _nome1 != null;

  // "Nome2" field.
  String? _nome2;
  String get nome2 => _nome2 ?? '';
  bool hasNome2() => _nome2 != null;

  // "Nome3" field.
  String? _nome3;
  String get nome3 => _nome3 ?? '';
  bool hasNome3() => _nome3 != null;

  // "Nome4" field.
  String? _nome4;
  String get nome4 => _nome4 ?? '';
  bool hasNome4() => _nome4 != null;

  // "Nome5" field.
  String? _nome5;
  String get nome5 => _nome5 ?? '';
  bool hasNome5() => _nome5 != null;

  // "Total_Aulas" field.
  String? _totalAulas;
  String get totalAulas => _totalAulas ?? '';
  bool hasTotalAulas() => _totalAulas != null;

  void _initializeFields() {
    _nome1 = snapshotData['Nome1'] as String?;
    _nome2 = snapshotData['Nome2'] as String?;
    _nome3 = snapshotData['Nome3'] as String?;
    _nome4 = snapshotData['Nome4'] as String?;
    _nome5 = snapshotData['Nome5'] as String?;
    _totalAulas = snapshotData['Total_Aulas'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TituloFilmes');

  static Stream<TituloFilmesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TituloFilmesRecord.fromSnapshot(s));

  static Future<TituloFilmesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TituloFilmesRecord.fromSnapshot(s));

  static TituloFilmesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TituloFilmesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TituloFilmesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TituloFilmesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TituloFilmesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TituloFilmesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTituloFilmesRecordData({
  String? nome1,
  String? nome2,
  String? nome3,
  String? nome4,
  String? nome5,
  String? totalAulas,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome1': nome1,
      'Nome2': nome2,
      'Nome3': nome3,
      'Nome4': nome4,
      'Nome5': nome5,
      'Total_Aulas': totalAulas,
    }.withoutNulls,
  );

  return firestoreData;
}

class TituloFilmesRecordDocumentEquality
    implements Equality<TituloFilmesRecord> {
  const TituloFilmesRecordDocumentEquality();

  @override
  bool equals(TituloFilmesRecord? e1, TituloFilmesRecord? e2) {
    return e1?.nome1 == e2?.nome1 &&
        e1?.nome2 == e2?.nome2 &&
        e1?.nome3 == e2?.nome3 &&
        e1?.nome4 == e2?.nome4 &&
        e1?.nome5 == e2?.nome5 &&
        e1?.totalAulas == e2?.totalAulas;
  }

  @override
  int hash(TituloFilmesRecord? e) => const ListEquality()
      .hash([e?.nome1, e?.nome2, e?.nome3, e?.nome4, e?.nome5, e?.totalAulas]);

  @override
  bool isValidKey(Object? o) => o is TituloFilmesRecord;
}
