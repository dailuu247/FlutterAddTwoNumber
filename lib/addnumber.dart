import 'package:flutter/material.dart';
class AddNumbers extends StatefulWidget {
  const AddNumbers({Key? key}) : super(key: key);
  //final TextEditingController controller;
  @override
  State<AddNumbers> createState() => _AddNumbersState();
}

class _AddNumbersState extends State<AddNumbers> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _num1 = TextEditingController();
    final _num2 = TextEditingController();
    final _tot = TextEditingController();
    int result;
    int sum;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: Column(
            children: [
              Text("Add Two Numbers",style: TextStyle(fontSize: 30, color: Colors.black),),
              SizedBox(height: 15,),
              TextField(
                controller: _num1,
                decoration: InputDecoration(
                  labelText: "Number 1",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _num2,
                decoration: InputDecoration(
                  labelText: "Number 2",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _tot,
                decoration: InputDecoration(
                  labelText: "Total",
                  labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade400),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  sum = int.parse(_num1.text) + int.parse(_num2.text);
                  print(sum);
                  List<String> result = [];
                  List<String> num1 = List<String>.generate(_num1.text.length, (index) => _num1.text[index]);
                  //print(num1[1]);
                  List<String> num2 = List<String>.generate(_num2.text.length, (index) => _num2.text[index]);
                  //print(num2[1]);
                  //print(num2.length);
                  int soChuSo =0;
                  int i;
                  if(num1.length > num2.length) {
                    soChuSo = num1.length;
                    for(i=num2.length;i<num1.length;i++) { num2=['0',...num2];};
                  }
                  if(num1.length == num2.length) {
                    soChuSo = num1.length;
                  }
                  if(num1.length < num2.length) {
                    soChuSo = num2.length;
                    for(i=num1.length;i<num2.length;i++) { num1=['0',...num1];};
                  }
                  print(num2.length);
                  List<int> total=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
                  //List<int> soDu = [0,0,0];
                  int soDu = 0;
                  for(i=soChuSo-1;i>=0;i--) {
                    total[i] = int.parse(num1[i]) + int.parse(num2[i]) + soDu;
                    if(total[i]>=10 && i==0) {
                      total[i]= total[i] % 10;
                      result=[total[i].toString(),...result];
                      result.insert(0,'1');
                    }
                    if(total[i] >= 10 && i!=0) {
                      total[i]= total[i] % 10;
                      soDu=1;
                    } else { soDu=0;}
                    result=[total[i].toString(),...result];
                  }
                  print(result);
                  _tot.text = result.join();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width,
                  decoration: BoxDecoration(color: Colors.red,
                  borderRadius: BorderRadius.circular(5)),
                  child: Text("Add",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
