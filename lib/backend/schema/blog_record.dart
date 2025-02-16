import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogRecord extends FirestoreRecord {
  BlogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blogNo" field.
  int? _blogNo;
  int get blogNo => _blogNo ?? 0;
  bool hasBlogNo() => _blogNo != null;

  // "blogIsim" field.
  String? _blogIsim;
  String get blogIsim => _blogIsim ?? '';
  bool hasBlogIsim() => _blogIsim != null;

  // "blogIcerigi" field.
  String? _blogIcerigi;
  String get blogIcerigi => _blogIcerigi ?? '';
  bool hasBlogIcerigi() => _blogIcerigi != null;

  // "blogIceigiEN" field.
  String? _blogIceigiEN;
  String get blogIceigiEN => _blogIceigiEN ?? '';
  bool hasBlogIceigiEN() => _blogIceigiEN != null;

  // "yuklenmeTarihi" field.
  DateTime? _yuklenmeTarihi;
  DateTime? get yuklenmeTarihi => _yuklenmeTarihi;
  bool hasYuklenmeTarihi() => _yuklenmeTarihi != null;

  // "likeSayisi" field.
  int? _likeSayisi;
  int get likeSayisi => _likeSayisi ?? 0;
  bool hasLikeSayisi() => _likeSayisi != null;

  // "goruntulenmeSayisi" field.
  int? _goruntulenmeSayisi;
  int get goruntulenmeSayisi => _goruntulenmeSayisi ?? 0;
  bool hasGoruntulenmeSayisi() => _goruntulenmeSayisi != null;

  // "blogIsimEN" field.
  String? _blogIsimEN;
  String get blogIsimEN => _blogIsimEN ?? '';
  bool hasBlogIsimEN() => _blogIsimEN != null;

  void _initializeFields() {
    _blogNo = castToType<int>(snapshotData['blogNo']);
    _blogIsim = snapshotData['blogIsim'] as String?;
    _blogIcerigi = snapshotData['blogIcerigi'] as String?;
    _blogIceigiEN = snapshotData['blogIceigiEN'] as String?;
    _yuklenmeTarihi = snapshotData['yuklenmeTarihi'] as DateTime?;
    _likeSayisi = castToType<int>(snapshotData['likeSayisi']);
    _goruntulenmeSayisi = castToType<int>(snapshotData['goruntulenmeSayisi']);
    _blogIsimEN = snapshotData['blogIsimEN'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blog');

  static Stream<BlogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogRecord.fromSnapshot(s));

  static Future<BlogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogRecord.fromSnapshot(s));

  static BlogRecord fromSnapshot(DocumentSnapshot snapshot) => BlogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogRecordData({
  int? blogNo,
  String? blogIsim,
  String? blogIcerigi,
  String? blogIceigiEN,
  DateTime? yuklenmeTarihi,
  int? likeSayisi,
  int? goruntulenmeSayisi,
  String? blogIsimEN,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blogNo': blogNo,
      'blogIsim': blogIsim,
      'blogIcerigi': blogIcerigi,
      'blogIceigiEN': blogIceigiEN,
      'yuklenmeTarihi': yuklenmeTarihi,
      'likeSayisi': likeSayisi,
      'goruntulenmeSayisi': goruntulenmeSayisi,
      'blogIsimEN': blogIsimEN,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogRecordDocumentEquality implements Equality<BlogRecord> {
  const BlogRecordDocumentEquality();

  @override
  bool equals(BlogRecord? e1, BlogRecord? e2) {
    return e1?.blogNo == e2?.blogNo &&
        e1?.blogIsim == e2?.blogIsim &&
        e1?.blogIcerigi == e2?.blogIcerigi &&
        e1?.blogIceigiEN == e2?.blogIceigiEN &&
        e1?.yuklenmeTarihi == e2?.yuklenmeTarihi &&
        e1?.likeSayisi == e2?.likeSayisi &&
        e1?.goruntulenmeSayisi == e2?.goruntulenmeSayisi &&
        e1?.blogIsimEN == e2?.blogIsimEN;
  }

  @override
  int hash(BlogRecord? e) => const ListEquality().hash([
        e?.blogNo,
        e?.blogIsim,
        e?.blogIcerigi,
        e?.blogIceigiEN,
        e?.yuklenmeTarihi,
        e?.likeSayisi,
        e?.goruntulenmeSayisi,
        e?.blogIsimEN
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogRecord;
}
