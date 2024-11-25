import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaFilmes3Record extends FirestoreRecord {
  ListaFilmes3Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "Detalhes" field.
  String? _detalhes;
  String get detalhes => _detalhes ?? '';
  bool hasDetalhes() => _detalhes != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "P1" field.
  String? _p1;
  String get p1 => _p1 ?? '';
  bool hasP1() => _p1 != null;

  // "P2" field.
  String? _p2;
  String get p2 => _p2 ?? '';
  bool hasP2() => _p2 != null;

  // "P3" field.
  String? _p3;
  String get p3 => _p3 ?? '';
  bool hasP3() => _p3 != null;

  // "Filme" field.
  String? _filme;
  String get filme => _filme ?? '';
  bool hasFilme() => _filme != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _img = snapshotData['Img'] as String?;
    _detalhes = snapshotData['Detalhes'] as String?;
    _data = snapshotData['Data'] as DateTime?;
    _p1 = snapshotData['P1'] as String?;
    _p2 = snapshotData['P2'] as String?;
    _p3 = snapshotData['P3'] as String?;
    _filme = snapshotData['Filme'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Lista-Filmes3');

  static Stream<ListaFilmes3Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListaFilmes3Record.fromSnapshot(s));

  static Future<ListaFilmes3Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListaFilmes3Record.fromSnapshot(s));

  static ListaFilmes3Record fromSnapshot(DocumentSnapshot snapshot) =>
      ListaFilmes3Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListaFilmes3Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListaFilmes3Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListaFilmes3Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListaFilmes3Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListaFilmes3RecordData({
  String? nome,
  String? img,
  String? detalhes,
  DateTime? data,
  String? p1,
  String? p2,
  String? p3,
  String? filme,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome': nome,
      'Img': img,
      'Detalhes': detalhes,
      'Data': data,
      'P1': p1,
      'P2': p2,
      'P3': p3,
      'Filme': filme,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListaFilmes3RecordDocumentEquality
    implements Equality<ListaFilmes3Record> {
  const ListaFilmes3RecordDocumentEquality();

  @override
  bool equals(ListaFilmes3Record? e1, ListaFilmes3Record? e2) {
    return e1?.nome == e2?.nome &&
        e1?.img == e2?.img &&
        e1?.detalhes == e2?.detalhes &&
        e1?.data == e2?.data &&
        e1?.p1 == e2?.p1 &&
        e1?.p2 == e2?.p2 &&
        e1?.p3 == e2?.p3 &&
        e1?.filme == e2?.filme;
  }

  @override
  int hash(ListaFilmes3Record? e) => const ListEquality().hash(
      [e?.nome, e?.img, e?.detalhes, e?.data, e?.p1, e?.p2, e?.p3, e?.filme]);

  @override
  bool isValidKey(Object? o) => o is ListaFilmes3Record;
}
