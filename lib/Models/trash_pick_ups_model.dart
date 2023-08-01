import 'package:cloud_firestore/cloud_firestore.dart';

class Trash_pickerUpsModel {
  
  final String? trashID;
  final String? postedDate;
  final String? trashName;
  final String? trashDescription;
  final String? trashImage;
  final List? trashTypes;
  final String? trashLocationAddress;
  final GeoPoint? trashLocationLocation;
  final String? startDate;
  final String? returnDate;
  final String? startTime;
  final String? returnTime;

  Trash_pickerUpsModel({
    this.trashID,
    this.postedDate,
    this.trashName,
    this.trashDescription,
    this.trashImage,
    this.trashTypes,
    this.trashLocationAddress,
    this.trashLocationLocation,
    this.startDate,
    this.returnDate,
    this.startTime,
    this.returnTime,
  });

  factory Trash_pickerUpsModel.fromDocument(DocumentSnapshot documentSnapshot) {
    return Trash_pickerUpsModel(
      trashID: documentSnapshot['trashID'],
      postedDate: documentSnapshot['postedDate'],
      trashName: documentSnapshot['trashName'],
      trashDescription: documentSnapshot['trashDescription'],
      trashImage: documentSnapshot['trashImage'],
      trashTypes: documentSnapshot['trashTypes'],
      trashLocationAddress: documentSnapshot['trashLocationAddress'],
      trashLocationLocation: documentSnapshot['trashLocationLocation'],
      startDate: documentSnapshot['startDate'],
      returnDate: documentSnapshot['returnDate'],
      startTime: documentSnapshot['startTime'],
      returnTime: documentSnapshot['returnTime'],
    );
  }
}
