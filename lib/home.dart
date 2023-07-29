import 'package:flutter/material.dart';

class homePage extends StatefulWidget{
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  double isTemp=0.0,outTemp=0.0;
  bool isFah= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.purple.shade100,
      appBar: AppBar(backgroundColor: Colors.purpleAccent.shade100,title: Text('Temperature Converter'),),

      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const IconData thermometer = IconData(0xf864, fontFamily: iconFont, fontPackage: iconFontPackage),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Temperature',
                  prefixIcon: Icon(Icons.thermostat),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                labelText: isFah
                    ? 'You entered $isTemp in Fahrenhiet'
                    :'You entered $isTemp in Celsius',
                ),
                keyboardType: TextInputType.number,
                onChanged: (newValue){
                  setState(() {
                    try{
                      isTemp=double.parse(newValue);
                    }catch(e){

                    }
                  });
                },
              ),
            ),
            RadioListTile(
                value: true,
                groupValue: isFah,
                title: Text('Fahrenheit'),
                onChanged: (newValue){
                  setState(() {
                    isFah=newValue!;
                  });
                }
            ),
            RadioListTile(
                value: false,
                groupValue: isFah,
                title: Text('Celsius'),
                onChanged: (newValue){
                  setState(() {
                    isFah=newValue!;
                  });
                }
            ),
            ElevatedButton(style:ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade400
            ) ,onPressed: (){
              setState(() {
                outTemp= isFah ? (isTemp-32) / (5/6):(isTemp*9/5)+32;
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text('The Result'),content: isFah
                    ? Text('$isTemp Fah = $outTemp Celsius')
                    : Text('$isTemp Celsius=$outTemp Fah'),
                ),);
              });
            }, child: Text('Convert')),
          ],
        )
      ),
    );
  }
}
