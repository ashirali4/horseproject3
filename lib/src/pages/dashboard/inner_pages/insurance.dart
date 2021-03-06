import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../net/firebase_operations.dart';
import '../../../utlis/constants.dart';
import '../../../widgets/button_round.dart';
import '../../../widgets/textfield.dart';
class Insurance extends StatefulWidget {
  const Insurance({Key? key}) : super(key: key);

  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {

  TextEditingController horse=TextEditingController();


  TextEditingController name=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController vern=TextEditingController();

  TextEditingController name2=TextEditingController();
  TextEditingController address2=TextEditingController();
  TextEditingController phone2=TextEditingController();
  TextEditingController email2=TextEditingController();
  TextEditingController vern2=TextEditingController();

  TextEditingController name3=TextEditingController();
  TextEditingController address3=TextEditingController();
  TextEditingController phone3=TextEditingController();
  TextEditingController email3=TextEditingController();
  TextEditingController vern3=TextEditingController();

  onSave() async {
    Map<String, dynamic> data = <String, dynamic>{
      "horse" : horse.text,
      "n1" : name.text,
      "a1" : address.text,
      "p1" : phone.text,
      "e1" : email.text,
      "v1" : vern.text,
      "n2" : name2.text,
      "a2" : address2.text,
      "p2" : phone2.text,
      "e2" : email2.text,
      "v2" : vern2.text,
      "n3" : name3.text,
      "a3" : address3.text,
      "p3" : phone3.text,
      "e3" : email3.text,
      "v3" : vern3.text
    };
    await FirebaseDB.savedata(data: data,type: 'insurance');
    EasyLoading.showToast('Insurance has been updated.',toastPosition: EasyLoadingToastPosition.bottom);
  }


  onGetData() async {
    try{
      var data= await FirebaseDB.getDataMap('insurance');
      setState(() {
        horse.text=data['horse'] ?? '';
        name.text=data['n1'] ?? '';
        address.text=data['a1'] ?? '';
        phone.text=data['p1'] ?? '';
        email.text=data['e1'] ?? '';
        vern.text=data['v1'] ?? '';
        name2.text=data['n2'] ?? '';
        address2.text=data['a2'] ?? '';
        phone2.text=data['p2'] ?? '';
        email2.text=data['e2'] ?? '';
        vern2.text=data['v2'] ?? '';
        name3.text=data['n3'] ?? '';
        address3.text=data['a3'] ?? '';
        phone3.text=data['p3'] ?? '';
        email3.text=data['e3'] ?? '';
        vern3.text=data['v3'] ?? '';
      });
    }catch (e){
      print("Erorr " + e.toString());
    }

  }


  @override
  void initState() {
    onGetData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: BACKGROUND_COLOR_DASHBOARD,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
        title: Text('Insurance'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageWidget('Upload Photo/Video',Icons.camera_alt_outlined),
              SizedBox(height: 10,),
              TextFieldApp(hintText: 'Name of Horse',hintTitle: 'Black Horse',controller: horse,),
              SizedBox(height: 10,),
              OtherBody('Liability',name,address,phone,email,vern),
              SizedBox(height: 10,),
              OtherBody('Health Insurance',name2,address2,phone2,email2,vern2),
              SizedBox(height: 10,),
              OtherBody('Surgical Insurance',name3,address3,phone3,email3,vern3),
              SizedBox(height: 10,),

              Container(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonRound(buttonText: 'Save', function:  (){
                    onSave();
                  },)),
              SizedBox(height: 30,),


            ],
          ),
        ),
      ),
    );
  }



  Widget OtherBody(String text,TextEditingController controller1,
      TextEditingController controller2,
      TextEditingController controller3,
      TextEditingController controller4, TextEditingController controller5,
      ){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
          SizedBox(height: 10,),
          TextFieldApp(hintText: 'Name',hintTitle: 'Name of Insurer',controller: controller1,),
          SizedBox(height: 10,),
          TextFieldApp(hintText: 'Address',hintTitle: 'Address here',controller: controller2,),
          SizedBox(height: 10,),
          TextFieldApp(hintText: 'Phone Number',hintTitle: '+9823423423',controller: controller3,),
          SizedBox(height: 10,),
          TextFieldApp(hintText: 'Email',hintTitle: 'test@gmail.com',controller: controller4,),
          SizedBox(height: 10,),
          TextFieldApp(hintText: 'Vers. Number',hintTitle: '123****',controller: controller5,),
          SizedBox(height: 10,),
          ImageWidget('Upload Documents',Icons.attach_file),

        ],
      ),
    );
  }

  Widget ImageWidget(String text,IconData icons){
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: BACKGROUND_COLOR_ADD_HORSE.withOpacity(.3),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        margin: EdgeInsets.only(top: 20,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: Icon(
                  icons,
                  size: 22.0,
                  color: BACKGROUND_COLOR_DASHBOARD,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(text,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),)
          ],
        )
    );
  }
}
