import 'package:flutter/material.dart';

class Uihelper{
  static CustomTextField(
      TextEditingController controller,String text,IconData? icondata,bool obscure,String obscureText) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        // obscureText:true,
        // obscuringCharacter: "*",
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
          suffixIcon: Icon(icondata),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
    static CustomButton(
        VoidCallback callback,String text){
      return Padding(
        padding: const EdgeInsets.only(left: 25),
        child: SizedBox(
          height: 50,
          width: 325,
          child: ElevatedButton(onPressed: (){
            callback();
          }, style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  )
              )), child: Text(text,style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
        ),
      );
    }

    static CustomAlertBox(BuildContext context,String text){
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))
          ],
        );
      });
    }

    static CustomFloatButton(VoidCallback callback){
      return FloatingActionButton(onPressed: (){
        callback();
      });
    }

    static CustomtextField(
        TextEditingController controller,String text,IconData? icondata,bool readOnly
        ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            readOnly: readOnly,
            style: TextStyle(color: Colors.white),
            //controller: controller,
            decoration: InputDecoration(
              hintText:text ,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(icondata,color: Colors.white),
            ),
          ),
        ],
      );
    }
  static CustomPassword(TextEditingController controller, String text, [String?params,bool?password,VoidCallback?callback]){
    return TextField(
      controller: controller,
      obscureText: password!,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: IconButton(
          icon: Icon(password?Icons.visibility_off:Icons.visibility),
          onPressed: callback,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}