import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_picker/Models/trash_pick_ups_model.dart';
import 'package:trash_picker/Widgets/button_widgets.dart';
import 'package:trash_picker/Widgets/secondary_app_bar_widget.dart';

class ViewTrashDetails extends StatefulWidget {
  final String userID, trashID, accountType;

  ViewTrashDetails(this.userID, this.trashID, this.accountType);

  @override
  _ViewTrashDetailsState createState() => _ViewTrashDetailsState();
}

class _ViewTrashDetailsState extends State<ViewTrashDetails> {
  final userReference = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  List? trashTypesList;

  Widget trashTypesFilter(Trash_pickerUpsModel trash_pickerUpsModel) {
    return Container(
      height: (trash_pickerUpsModel.trashTypes!.length.toDouble() * 45),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: trash_pickerUpsModel.trashTypes!.length,
          itemBuilder: (BuildContext context, int index) {
            Color trashTypeColor;
            String trashTypeDescription;

            switch (trash_pickerUpsModel.trashTypes![index]) {
              case "Plastic & Polythene":
                trashTypeColor = Colors.orange.shade700;
                trashTypeDescription = "Plastic & Polythene";
                break;
              case "Glass":
                trashTypeColor = Colors.red;
                trashTypeDescription = "Glass";
                break;
              case "Paper":
                trashTypeColor = Colors.blue;
                trashTypeDescription = "Paper";
                break;
              case "Metal & Coconut Shell":
                trashTypeColor = Colors.black;
                trashTypeDescription = "Metal & Coconut Shell";
                break;
              case "Clinical Waste":
                trashTypeColor = Colors.yellow;
                trashTypeDescription = "Clinical Waste";
                break;
              case "E-Waste":
                trashTypeColor = Colors.grey.shade200;
                trashTypeDescription = "E-Waste";
                break;
              default:
                trashTypeColor = Colors.grey.shade100;
                trashTypeDescription = "Other";
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                children: [
                  Container(
                    height: 20.0,
                    width: 20.0,
                    color: trashTypeColor,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(trash_pickerUpsModel.trashTypes![index]),
                ],
              ),
            );
          }),
    );
  }

  trashTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          fontWeight: FontWeight.bold),
    );
  }

  trashDetailsData(String detailsData) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: Text(
        detailsData,
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  trashAvailableDatesTimes(
      bool isDate, String titleS, String dataS, String titleR, String dataR) {
    IconData typeIcon;

    if (isDate) {
      typeIcon = Icons.date_range_rounded;
    } else {
      typeIcon = Icons.access_time_rounded;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              typeIcon,
              size: 35.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                trashTitle(titleS),
                trashDetailsData(dataS),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              typeIcon,
              size: 35.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                trashTitle(titleR),
                trashDetailsData(dataR),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget trashDetails() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(widget.userID)
          .collection('Trash Pick Ups')
          .where('trashID', isEqualTo: widget.trashID)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //return profileHeaderShimmer();
          return Text(
            "Data Unavailable",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                fontWeight: FontWeight.bold),
          );
        } else {
          Trash_pickerUpsModel trash_pickerUpsModel =
              Trash_pickerUpsModel.fromDocument(snapshot.data!.docs[0]);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${trash_pickerUpsModel.trashName}",
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  trash_pickerUpsModel.trashImage!,
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  trashTitle("Trash Location"),
                  trashDetailsData(trash_pickerUpsModel.trashLocationAddress??""),
                  SizedBox(
                    height: 20.0,
                  ),
                  trashTitle("Trash Description"),
                  trashDetailsData(trash_pickerUpsModel.trashDescription??""),
                  SizedBox(
                    height: 20.0,
                  ),
                  trashTitle("Trash Types"),
                  trashDetailsData(trash_pickerUpsModel.trashTypes.toString()),
                  trashTypesFilter(trash_pickerUpsModel),
                  trashAvailableDatesTimes(
                      true,
                      "Start Date",
                      trash_pickerUpsModel.startDate!,
                      "Return Date",
                      trash_pickerUpsModel.returnDate!),
                  SizedBox(
                    height: 20.0,
                  ),
                  trashAvailableDatesTimes(
                      false,
                      "Start Time",
                      trash_pickerUpsModel.startTime!,
                      "Return Time",
                      trash_pickerUpsModel.returnTime!),
                  SizedBox(
                    height: 20.0,
                  ),
                  trashTitle("Posted Date"),
                  trashDetailsData(trash_pickerUpsModel.postedDate!),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: widget.accountType == "Trash Picker"
                        ? MinButtonWidget(
                            text: "Edit Trash Pick Up",
                            color: Theme.of(context).colorScheme.background,
                            onClicked: () =>
                                {print("Edit Trash Pick Ups Pressed!")},
                          )
                        : Container(),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        title: "About Trash",
        appBar: AppBar(),
        widgets: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Image.asset(
                "assets/icons/icon_trash_sort.png",
                height: 35.0,
                width: 35.0,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: trashDetails(),
        ),
      ),
    );
  }
}
